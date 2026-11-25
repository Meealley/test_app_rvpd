import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/usecases/add_task.dart';
import 'package:new_task_app/features/tasks/domain/usecases/update_task.dart';

import '../../../../helpers/fake_task_repository.dart';

void main() {
  late FakeTaskRepository repo;
  late AddTask addTask;
  late UpdateTask updateTask;
  final fixedTime = DateTime(2026, 1, 1);

  setUp(() {
    repo = FakeTaskRepository();
    addTask = AddTask(repo, generateId: () => "id-1", now: () => fixedTime);
    updateTask = UpdateTask(repo);
  });

  test("reject an empty title", () async {
    // a task that really exists
    final task = await addTask('Bill');

    // update it with blank title
    await expectLater(
      updateTask(task.copyWith(title: '  ')),
      throwsA(isA<InvalidTaskTitleException>()),
    );

    expect(await repo.getTasks(), [task]);
  });

  test("throw TaskNotFoundException for id that was never added", () async {
    final ghost = Task(id: 'never-added', title: 'Ghost', createdAt: fixedTime);

    await expectLater(updateTask(ghost), throwsA(isA<TaskNotFoundException>()));
  });

  test('saves the new title (trimmed) and completion', () async {
    final task = await addTask("Bill");

    await updateTask(task.copyWith(title: '  Pay bill  ', isCompleted: true));

    expect(await repo.getTasks(), [
      task.copyWith(title: 'Pay bill', isCompleted: true),
    ]);
  });
}
