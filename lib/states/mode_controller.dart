import 'package:hooks_riverpod/hooks_riverpod.dart';

final modeProvider = StateNotifierProvider((ref) => ModeState());

class ModeState extends StateNotifier<bool> {
  ModeState(): super(false);

  void change() => state = !state;
}
