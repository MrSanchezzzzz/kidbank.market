import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/ages.dart';

class SelectedAgeNotifier extends StateNotifier<Age?> {
  SelectedAgeNotifier() : super(null);

  void setAge(Age? age) {
    state = age;
  }
}

final selectedAgeProvider = StateNotifierProvider<SelectedAgeNotifier, Age?>((ref) {
  return SelectedAgeNotifier();
});