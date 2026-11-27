import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';

void runTaskRepositoryContract(TaskRepository Function() createRepo) {
  late TaskRepository repo;
  final time = DateTime(2026, 1, 1);
  Task makeTask(String id) => Task(id: id, title: 'Task $id', createdAt: time);

  setUp(() => repo = createRepo());

  test('starts empty', () async {
    expect(await repo.getTasks(), isEmpty);
  });

  test('addTask then getTasks returns the task', () async {
    await repo.addTask(makeTask('1'));
    expect(await repo.getTasks(), [makeTask('1')]);
  });

  test('updateTask throws TaskNotFoundException for an unknown id', () async {
    await expectLater(
      repo.updateTask(makeTask('ghost')),
      throwsA(isA<TaskNotFoundException>()),
    );
  });

  test('deleteTask removes only that task', () async {
    await repo.addTask(makeTask('1'));
    await repo.addTask(makeTask('2'));

    await repo.deleteTask('1');

    expect(await repo.getTasks(), [makeTask('2')]);
  });

  test('deleteTask does nothing for an unknown id', () async {
    await repo.addTask(makeTask('1'));
    await repo.deleteTask('ghost');
    expect(await repo.getTasks(), [makeTask('1')]);
  });
}
