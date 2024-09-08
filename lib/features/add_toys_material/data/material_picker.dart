import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/add_toys_material/data/toy_materil_model.dart';

class ToyMaterialPickerNotifier extends StateNotifier<ToyMaterialPickerModel> {
  ToyMaterialPickerNotifier() : super(ToyMaterialPickerModel());

  void selectMaterial(ToyMaterial material) {
    if (state.firstMaterial == null) {
      state = state.copyWith(firstMaterial: material);
    } else if (state.secondMaterial == null) {
      state = state.copyWith(secondMaterial: material);
    }
  }

  void deselectMaterial(ToyMaterial material) {
    if (state.firstMaterial?.label == material.label) {
      state = state.copyWith(firstMaterial: null);
    } else if (state.secondMaterial?.label == material.label) {
      state = state.copyWith(secondMaterial: null);
    }
  }

  void toggleMaterial(ToyMaterial material) {
    if (state.isSelected(material.label)) {
      deselectMaterial(material);
    } else {
      if (state.selectedCount < 2) {
        selectMaterial(material);
      } else {
        state = state.copyWith(
          firstMaterial: state.secondMaterial,
          secondMaterial: material,
        );
      }
    }
  }
}

final selectedMaterialsProvider =
    StateNotifierProvider<ToyMaterialPickerNotifier, ToyMaterialPickerModel>(
        (ref) {
  return ToyMaterialPickerNotifier();
});
