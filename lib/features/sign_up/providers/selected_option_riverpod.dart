
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectedOptionNotifier extends StateNotifier<int> {
  SelectedOptionNotifier() : super(-1);

  void setValue(int value)=>state=value;
}

final selectedSurveyOptionProvider = StateNotifierProvider<SelectedOptionNotifier, int>((ref) {
  return SelectedOptionNotifier();
});