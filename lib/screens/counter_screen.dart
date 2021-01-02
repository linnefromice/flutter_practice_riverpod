import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final counterProvider = StateNotifierProvider((ref) => CounterState());

class CounterState extends StateNotifier<int> {
  CounterState(): super(0);

  void increment() => state++;
  void decrement() => state--;
}

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    final count = watch(counterProvider.state);
    final counterState = watch(counterProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Current Counter Number:",
                textAlign: TextAlign.center,
            ),
            Text(
                count.toString(),
                textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {
                counterState.increment();
              },
              icon: Icon(Icons.add),
              label: Text("Plus One"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                counterState.decrement();
              },
              icon: Icon(Icons.remove),
              label: Text("Minus One"),
            )
          ],
        ),
      ),
    );
  }
}