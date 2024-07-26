import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/categories.dart';

class SelectedCategoryNotifier extends StateNotifier<Category?> {
  SelectedCategoryNotifier() : super(null);

  void setCategory(Category? category) {
    state = category;
  }
}

final selectedCategoryProvider = StateNotifierProvider<SelectedCategoryNotifier, Category?>((ref) {
  return SelectedCategoryNotifier();
});