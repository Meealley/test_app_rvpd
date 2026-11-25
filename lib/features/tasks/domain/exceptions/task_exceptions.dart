class InvalidTaskTitleException implements Exception {
  const InvalidTaskTitleException();
  @override
  String toString() => 'Task title cannot be empty';
}

class TaskNotFoundException implements Exception {
  final String id;
  const TaskNotFoundException(this.id);
  @override
  String toString() => 'No task found with "$id"';
}
