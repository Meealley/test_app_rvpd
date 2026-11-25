import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;
  final String Function() _generateId;
  final DateTime Function() _now;

  AddTask(
    this.repository, {
    String Function()? generateId,
    DateTime Function()? now,
  }) : _generateId = generateId ?? _defaultId,
       _now = now ?? DateTime.now;

  static String _defaultId() =>
      DateTime.now().microsecondsSinceEpoch.toString();

  Future<Task> call(String title) async {
    final trimmed = title.trim();
    if (trimmed.isEmpty) throw const InvalidTaskTitleException();
    final task = Task(id: _generateId(), title: trimmed, createdAt: _now());
    await repository.addTask(task);
    return task;
  }
}
