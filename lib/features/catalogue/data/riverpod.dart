import 'package:hooks_riverpod/hooks_riverpod.dart';

class DisplayModeNotifier extends StateNotifier<bool> {
  DisplayModeNotifier() : super(false);

  void toggleDisplayMode() {
    state = !state;
  }
}

final displayModeProvider = StateNotifierProvider<DisplayModeNotifier, bool>((ref) {
  return DisplayModeNotifier();
});