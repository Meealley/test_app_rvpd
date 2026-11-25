import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';

const maxTaskTitleLength = 100;

// Clean the title and check the rules/
// Returns the trimmed title, or throw if it is not allowed
String validateTaskTitle(String rawTitle) {
  final title = rawTitle.trim();
  if (title.isEmpty) throw const InvalidTaskTitleException();
  if (title.length > maxTaskTitleLength) {
    throw const TaskTitleTooLongException(maxTaskTitleLength);
  }
  return title;
}
