import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/models/colors.dart';
import 'package:kidbank/core/models/toy_property.dart';

class ToyListingNotifier<T> extends StateNotifier<T?>{
  ToyListingNotifier({T? value}):super(value);

  void setValue(T value) {
    state = value;
  }
}

final selectedTitleProvider=StateNotifierProvider<ToyListingNotifier<String?>,String?>((ref){
  return ToyListingNotifier<String?>();
});

final selectedDescriptionProvider=StateNotifierProvider<ToyListingNotifier<String?>,String?>((ref){
  return ToyListingNotifier<String?>();
});

final selectedPriceProvider=StateNotifierProvider<ToyListingNotifier<int?>,int?>((ref){
  return ToyListingNotifier<int?>(value: 550);
});

final selectedQuantityProvider=StateNotifierProvider<ToyListingNotifier<int?>,int?>((ref){
  return ToyListingNotifier<int?>();
});

///Toy parameters
final selectedAgeProvider = StateNotifierProvider<ToyListingNotifier<ToyProperty?>, ToyProperty?>((ref) {
  return ToyListingNotifier<ToyProperty?>();
});

final selectedCategoryProvider = StateNotifierProvider<ToyListingNotifier<ToyProperty?>, ToyProperty?>((ref) {
  return ToyListingNotifier<ToyProperty?>();
});

final selectedConditionProvider = StateNotifierProvider<ToyListingNotifier<ToyProperty?>, ToyProperty?>((ref) {
  return ToyListingNotifier<ToyProperty?>();
});

final selectedColorProvider = StateNotifierProvider<ToyListingNotifier<ToyColor?>, ToyColor?>((ref) {
  return ToyListingNotifier<ToyColor?>();
});

final selectedMaterialProvider = StateNotifierProvider<ToyListingNotifier<ToyProperty?>, ToyProperty?>((ref) {
  return ToyListingNotifier<ToyProperty?>();
});

final selectedAllowedExchangeProvider=StateNotifierProvider<ToyListingNotifier<bool?>, bool?>((ref){
  return ToyListingNotifier<bool?>(value: false);
});
///