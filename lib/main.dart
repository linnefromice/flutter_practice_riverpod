import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linnefromice/screens/counter_screen.dart';
import 'package:linnefromice/screens/home_screen.dart';
import 'package:linnefromice/screens/user_screen.dart';
import 'package:linnefromice/states/mode_controller.dart';

void main() {
  runApp(
    ProviderScope(
      child: App(),
    )
  );
}

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = useProvider(modeProvider.state);
    return MaterialApp(
      title: 'Practice State',
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      home: UserScreen() // HomeScreen(),
    );
  }
}
