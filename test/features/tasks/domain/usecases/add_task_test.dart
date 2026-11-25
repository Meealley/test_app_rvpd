import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/usecases/add_task.dart';

import '../../../../helpers/fake_task_repository.dart';

void main() {
  late FakeTaskRepository repo;
  late AddTask addTask;
  final fixedTime = DateTime(2026, 1, 1);

  setUp(() {
    repo = FakeTaskRepository();
    addTask = AddTask(repo, generateId: () => "id-1", now: () => fixedTime);
  });

  test('saves a trimmed task with the generated id and time', () async {
    final task = await addTask(' Buy milk ');
    expect(task, Task(id: 'id-1', title: "Buy milk", createdAt: fixedTime));
    expect(await repo.getTasks(), [task]);
  });

  test('reects an empty title and saves nothing', () async {
    await expectLater(addTask('  '), throwsA(isA<InvalidTaskTitleException>()));
  });
}
