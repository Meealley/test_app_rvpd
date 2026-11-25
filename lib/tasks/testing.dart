import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/entities/task_filter.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';

class TesingGetTasks {
  final TaskRepository repo;
  final String Function() _generateId;
  final DateTime Function() _now;

  TesingGetTasks(
    this.repo, {
    String Function()? generateId,
    DateTime Function()? now,
  }) : _generateId = generateId ?? _defaultId,
       _now = now ?? DateTime.now;

  static String _defaultId() =>
      DateTime.now().microsecondsSinceEpoch.toString();

  // const TesingGetTasks(this.repo);
  Future<Task> call(String title) async {
    final trimmed = title.trim();
    if (trimmed.isEmpty) throw const InvalidTaskTitleException();
    final task = Task(id: _generateId(), title: trimmed, createdAt: _now());
    await repo.addTask(task);
    return task;
  }
}
