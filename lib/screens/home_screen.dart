import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linnefromice/states/mode_controller.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final mode = useProvider(modeProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => mode.change(),
          )
        ],
      ),
      body: Center(
        child: Text("HOME"),
      ),
    );
  }
}