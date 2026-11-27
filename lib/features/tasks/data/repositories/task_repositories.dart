import 'package:new_task_app/features/tasks/data/datasources/task_local_datasource.dart';
import 'package:new_task_app/features/tasks/data/models/task_model.dart';
import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDatasource dataSource;
  const TaskRepositoryImpl(this.dataSource);

  @override
  Future<List<Task>> getTasks() async {
    final models = await dataSource.readAll();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> addTask(Task task) async {
    final models = await dataSource.readAll();
    await dataSource.writeAll([...models, TaskModel.fromEntity(task)]);
  }

  @override
  Future<void> updateTask(Task task) async {
    final models = await dataSource.readAll();
    final index = models.indexWhere((m) => m.id == task.id);

    if (index == -1) throw TaskNotFoundException(task.id);

    final updated = [...models];
    updated[index] = TaskModel.fromEntity(task);
    await dataSource.writeAll(updated);
  }

  @override
  Future<void> deleteTask(String id) async {
    final models = await dataSource.readAll();
    await dataSource.writeAll(models.where((m) => m.id != id).toList());
  }
}
