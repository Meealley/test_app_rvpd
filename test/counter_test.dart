import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_task_app/main.dart';

void main() {
  test('increments adds one', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(counterProvider), 0);

    container.read(counterProvider.notifier).incre();

    expect(container.read(counterProvider), 1);
  });
  test('decrements by one', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(counterProvider), 0);

    container.read(counterProvider.notifier).decre();

    expect(container.read(counterProvider), -1);
  });
  test('resets to zero', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    expect(container.read(counterProvider), 0);

    container.read(counterProvider.notifier).reset();

    expect(container.read(counterProvider), 0);
  });
}
