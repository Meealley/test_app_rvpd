import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/features/tasks/domain/entities/task.dart';
import 'package:new_task_app/features/tasks/domain/entities/task_filter.dart';
import 'package:new_task_app/features/tasks/domain/usecases/filter_tasks.dart';

void main() {
  const filterTasks = FilterTasks();
  final time = DateTime(2026, 1, 1);
  final done = Task(id: '1', title: "Done", isCompleted: true, createdAt: time);
  final pending = Task(id: '2', title: 'Pending', createdAt: time);
  final all = [done, pending];

  test('all returns everything', () {
    expect(filterTasks(all, TaskFilter.all), all);
  });

  test('completed returns only finished tasks', () {
    expect(filterTasks(all, TaskFilter.completed), [done]);
  });

  test('active reutrn only unfinished tasks', () {
    expect(filterTasks(all, TaskFilter.active), [pending]);
  });
}
