import 'package:equatable/equatable.dart';
import '../../domain/entities/task.dart';

class TaskModel extends Equatable {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  const TaskModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  /// Domain -> Data
  factory TaskModel.fromEntity(Task task) => TaskModel(
    id: task.id,
    title: task.title,
    isCompleted: task.isCompleted,
    createdAt: task.createdAt,
  );

  /// Data -> Domain
  Task toEntity() => Task(
    id: id,
    title: title,
    isCompleted: isCompleted,
    createdAt: createdAt,
  );

  /// Storage -> Data
  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    id: json['id'] as String,
    title: json['title'] as String,
    isCompleted: json['isCompleted'] as bool,
    createdAt: DateTime.parse(json['createdAt'] as String),
  );

  /// Data -> Storage
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'isCompleted': isCompleted,
    'createdAt': createdAt.toIso8601String(),
  };

  @override
  List<Object?> get props => [id, title, isCompleted, createdAt];
}
