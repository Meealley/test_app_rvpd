import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/entities/task_filter.dart';

class FilterTasks {
  const FilterTasks();

  List<Task> call(List<Task> tasks, TaskFilter filter) {
    return switch (filter) {
      TaskFilter.all => tasks,
      TaskFilter.active => tasks.where((t) => !t.isCompleted).toList(),
      TaskFilter.completed => tasks.where((t) => t.isCompleted).toList(),
    };
  }
}
