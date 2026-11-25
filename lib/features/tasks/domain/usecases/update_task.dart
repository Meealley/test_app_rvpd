import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';

class UpdateTask {
  final TaskRepository repository;
  const UpdateTask(this.repository);

  Future<void> call(Task task) async {
    final title = task.title.trim();
    if (title.isEmpty) throw const InvalidTaskTitleException();
    await repository.updateTask(task.copyWith(title: title));
  }
}
