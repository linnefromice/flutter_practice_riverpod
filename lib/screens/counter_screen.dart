import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, T Function<T>(ProviderBase<Object, T> provider) watch) {
    return Scaffold(
      body: Center(
        child: Text("Counter"),
      ),
    );
  }
}