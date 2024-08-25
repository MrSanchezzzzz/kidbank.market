import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToyMaterialPickerModel {
  final ToyMaterialPickerModel? firstMaterial;
  final ToyMaterialPickerModel? secondMaterial;

  ToyMaterialPickerModel({this.firstMaterial, this.secondMaterial});

  ToyMaterialPickerModel copyWith({ToyMaterialPickerModel? firstMaterial, ToyMaterialPickerModel? secondMaterial}) {
    return ToyMaterialPickerModel(
      firstMaterial: firstMaterial ?? this.firstMaterial,
      secondMaterial: secondMaterial ?? this.secondMaterial,
    );
  }
}

class ToyMaterialPickerNotifier extends StateNotifier<ToyMaterialPickerModel> {
  ToyMaterialPickerNotifier() : super(ToyMaterialPickerModel());

  void selectFirstToyMaterial(ToyMaterialPickerModel firstMaterial) {
    state = state.copyWith(firstMaterial: firstMaterial);
  }

  void selectSecondToyMaterial(ToyMaterialPickerModel secondMaterial) {
    state = state.copyWith(secondMaterial: secondMaterial);
  }
}

final selectedMaterialsProvider =
    StateNotifierProvider<ToyMaterialPickerNotifier, ToyMaterialPickerModel>((ref) {
  return ToyMaterialPickerNotifier();
});
