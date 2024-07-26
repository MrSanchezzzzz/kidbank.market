import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/models/ages.dart';
import '../../../core/models/categories.dart';
import 'filter.dart';

class FilterNotifier extends StateNotifier<Filter> {
  FilterNotifier() : super(Filter());

  void setFilter(Filter filter) {
    state = filter;
  }
  void setCategories(List<Category> categories) {
    state=state.copyWith(categories: categories);
  }
  void setAges(List<Age> ages) {
    state=state.copyWith(ages: ages);
  }
  void setColors(List<Color> colors) {
    state=state.copyWith(colors: colors);
  }
  void setPrices(int min,int max) {
    state=state.copyWith(prices: (min,max));
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Filter>((ref) {
  return FilterNotifier();
});