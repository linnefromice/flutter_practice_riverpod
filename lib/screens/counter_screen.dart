import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
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
                "0",
                textAlign: TextAlign.center,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Plus One"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.remove),
              label: Text("Minus One"),
            )
          ],
        ),
      ),
    );
  }
}