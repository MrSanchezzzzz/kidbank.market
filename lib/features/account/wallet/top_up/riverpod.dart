import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedAmountNotifier extends StateNotifier<double?> {
  SelectedAmountNotifier() : super(null);

  void setAmount(double? value) {
    state = value;
  }
}

final selectedAmountProvider = StateNotifierProvider<SelectedAmountNotifier, double?>((ref) {
  return SelectedAmountNotifier();
});

///
class TempAmountNotifier extends StateNotifier<double?> {
  TempAmountNotifier() : super(null);

  void setAmount(double? value) {
    state = value;
  }
}
final tempTotalAmountProvider = StateNotifierProvider<TempAmountNotifier, double?>((ref) {
  return TempAmountNotifier();
});
final tempCurrentAmountProvider = StateNotifierProvider<TempAmountNotifier, double?>((ref) {
  return TempAmountNotifier();
});