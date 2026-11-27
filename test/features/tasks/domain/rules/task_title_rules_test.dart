import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/features/tasks/domain/exceptions/task_exceptions.dart';
import 'package:new_task_app/features/tasks/domain/rules/task_title_rules.dart';

void main() {
  test("trims spaces around the title", () {
    expect(validateTaskTitle(' hi '), 'hi');
  });

  test('rejects an empty title', () {
    expect(
      () => validateTaskTitle('  '),
      throwsA(isA<InvalidTaskTitleException>()),
    );
  });

  test('accepts a title of exactly 100 characters', () {
    final title = 'a' * 100;
    expect(validateTaskTitle(title), title);
  });

  test('rejects a title of 101 characters', () {
    expect(
      () => validateTaskTitle('a' * 101),
      throwsA(isA<TaskTitleTooLongException>()),
    );
  });
}
