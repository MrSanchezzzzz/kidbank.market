import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/add_toys_color/presentation/widgets/color_picker_model.dart';

class ColorPickerNotifier extends StateNotifier<ColorPickerModel> {
  ColorPickerNotifier() : super(ColorPickerModel());

  void selectFirstColor(Color color) {
    state = ColorPickerModel(firstColor: color, secondColor: state.secondColor);
  }

  void selectSecondColor(Color color) {
    state = ColorPickerModel(firstColor: state.firstColor, secondColor: color);
  }
}

final colorPickerProvider = StateNotifierProvider<ColorPickerNotifier, ColorPickerModel>((ref) {
  return ColorPickerNotifier();
});
