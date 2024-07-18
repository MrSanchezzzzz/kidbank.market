import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedPageNotifier extends StateNotifier<int> {
  SelectedPageNotifier() : super(0);

  void setPage(int index) {
    state = index;
  }
}

final selectedPageProvider = StateNotifierProvider<SelectedPageNotifier, int>((ref) {
  return SelectedPageNotifier();
});