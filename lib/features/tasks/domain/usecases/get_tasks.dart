import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repository;

  const GetTasks(this.repository);

  Future<List<Task>> call() => repository.getTasks();
}
