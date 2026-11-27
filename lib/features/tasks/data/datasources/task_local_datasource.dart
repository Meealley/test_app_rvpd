import 'package:new_task_app/features/tasks/data/models/task_model.dart';

abstract class TaskLocalDatasource {
  Future<List<TaskModel>> readAll();
  Future<void> writeAll(List<TaskModel> tasks);
}
