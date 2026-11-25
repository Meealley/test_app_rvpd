import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_task_app/tasks/home.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class CounterNotifer extends Notifier<int> {
  @override
  int build() => 0;

  void decre() => state = state - 1;
  void reset() => state = 0;
  void incre() => state = state + 1;
}

final counterProvider = NotifierProvider<CounterNotifer, int>(
  CounterNotifer.new,
);
final doubledProvider = Provider<int>((ref) {
  return ref.watch(counterProvider) * 2;
});
final greetingProvider = Provider<String>((ref) => "hello mujin oyewale");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: CounterPage());
  }
}
