import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/features/tasks/data/models/task_model.dart';
import 'package:new_task_app/features/tasks/domain/entities/task.dart';

void main() {
  final time = DateTime(2026, 1, 1, 9, 30);
  final model = TaskModel(
    id: '1',
    title: 'Buy milk',
    isCompleted: true,
    createdAt: time,
  );

  test('toJson then fromJson gives back the same model', () {
    expect(TaskModel.fromJson(model.toJson()), model);
  });

  test('toJson uses simple storable values', () {
    expect(model.toJson(), {
      'id': '1',
      'title': 'Buy milk',
      'isCompleted': true,
      'createdAt': time.toIso8601String(),
    });
  });

  test('fromEntity then toEntity gives back the same task', () {
    final task = Task(
      id: '1',
      title: 'Buy milk',
      createdAt: time,
      isCompleted: true,
    );
    expect(TaskModel.fromEntity(task).toEntity(), task);
  });
}
