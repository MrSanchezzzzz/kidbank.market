import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/models/toy_property.dart';

import '../../../core/models/ages.dart';
import '../../../core/models/categories.dart';
import 'filter.dart';

class FilterNotifier extends StateNotifier<Filter> {
  FilterNotifier() : super(Filter());

  void setFilter(Filter filter) {
    state = filter;
  }
  void setCategories(List<ToyProperty> categories) {
    state=state.copyWith(categories: categories);
  }
  void setAges(List<ToyProperty> ages) {
    state=state.copyWith(ages: ages);
  }
  void setTradability(bool value){
    state=state.copyWith(tradability: value);
  }
  void setConditions(List<ToyProperty> conditions){
    state=state.copyWith(conditions: conditions);
  }
  void setColors(List<Color> colors) {
    state=state.copyWith(colors: colors);
  }
  void addColor(Color color){
    List<Color> colors=state.colors;
    colors.add(color);
    state=state.copyWith(colors: colors);
  }
  void removeColor(Color color){
    List<Color> colors=state.colors;
    colors.remove(color);
    state=state.copyWith(colors: colors);
  }
  void setPrices(int min,int max) {
    state=state.copyWith(prices: (min,max));
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Filter>((ref) {
  return FilterNotifier();
});