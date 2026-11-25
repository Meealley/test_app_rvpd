// import 'package:flutter/material.dart';

// class CounterPage extends StatefulWidget {
//   const CounterPage({super.key});

//   @override
//   State<CounterPage> createState() => _CounterPageState();
// }

// class _CounterPageState extends State<CounterPage> {
//   int _count = 0; // the state

//   void _increment() {
//     setState(() {
//       // "state changed, call build again!"
//       _count++;
//     });
//   }

//   void _decrement() {
//     setState(() {
//       // "state changed, call build again!"
//       _count--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(child: Text('Count: $_count')),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               TextButton(onPressed: _increment, child: Text("Increase")),

//               TextButton(onPressed: _decrement, child: Text("Decrease")),
//             ],
//           ),
//         ],
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _increment,
//       //   child: const Icon(Icons.add),
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_task_app/main.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final doubled = ref.watch(doubledProvider); // READ + subscribe

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('Count: $count')),
            Center(child: Text('Doubled: $doubled')),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: ref.read(counterProvider.notifier).incre,
                  child: Text("Increase"),
                ),
                TextButton(
                  onPressed: ref.read(counterProvider.notifier).reset,
                  child: Text("Reset"),
                ),

                TextButton(
                  onPressed: ref.read(counterProvider.notifier).decre,
                  child: Text("Decrease"),
                ),
              ],
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () =>
      //       ref.read(counterProvider.notifier).incre(), // CALL an action
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
