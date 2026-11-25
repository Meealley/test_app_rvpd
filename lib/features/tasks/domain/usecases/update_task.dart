import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';
import 'package:new_task_app/features/tasks/domain/rules/task_title_rules.dart';

class UpdateTask {
  final TaskRepository repository;
  const UpdateTask(this.repository);

  Future<void> call(Task task) async {
    final title = validateTaskTitle(task.title);
    await repository.updateTask(task.copyWith(title: title));
  }
}
