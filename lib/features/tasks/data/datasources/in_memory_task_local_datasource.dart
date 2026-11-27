import 'package:new_task_app/features/tasks/data/datasources/task_local_datasource.dart';
import 'package:new_task_app/features/tasks/data/models/task_model.dart';

class InMemoryTaskLocalDatasource implements TaskLocalDatasource {
  List<TaskModel> _tasks = [];

  @override
  Future<List<TaskModel>> readAll() async => List.unmodifiable(_tasks);

  @override
  Future<void> writeAll(List<TaskModel> tasks) async {
    _tasks = List.of(tasks); // This stores a copy; never the caller's list
  }
}
