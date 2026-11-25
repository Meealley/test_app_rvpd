import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';

class FakeTaskRepository implements TaskRepository {
  final List<Task> _tasks = [];

  @override
  Future<List<Task>> getTasks() async => List.unmodifiable(_tasks);

  @override
  Future<void> addTask(Task task) async => _tasks.add(task);

  @override
  Future<void> updateTask(Task task) async {
    final i = _tasks.indexWhere((t) => t.id == task.id);
    if (i == -1) throw TaskNotFoundException(task.id);
    _tasks[i] = task;
  }

  @override
  Future<void> deleteTask(String id) async =>
      _tasks.removeWhere((t) => t.id == id);
}
