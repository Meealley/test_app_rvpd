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

class TaskTitleTooLongException implements Exception {
  final int maxLength;

  const TaskTitleTooLongException(this.maxLength);

  @override
  String toString() => 'Task title cannot be longer than $maxLength characters';
}
