import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/add_toys_condition/data/condition_model.dart';

class ConditionPickerNotifier extends StateNotifier<ConditionPickerModel> {
  ConditionPickerNotifier() : super(ConditionPickerModel());

  void selectMaterial(Condition condition) {
    if (state.firstCondition == null) {
      state = state.copyWith(firstCondition: condition);
    } else if (state.secondCondition == null) {
      state = state.copyWith(secondCondition: condition);
    }
  }

  void deselectMaterial(Condition condition) {
    if (state.firstCondition?.label == condition.label) {
      state = state.copyWith(firstCondition: null);
    } else if (state.secondCondition?.label == condition.label) {
      state = state.copyWith(secondCondition: null);
    }
  }

  void toggleCondition(Condition condition) {
    if (state.isSelected(condition.label)) {
      deselectMaterial(condition);
    } else {
      if (state.selectedCount < 2) {
        selectMaterial(condition);
      } else {
        state = state.copyWith(
          firstCondition: state.secondCondition,
          secondCondition: condition,
        );
      }
    }
  }
}

final selectedConditionProvider =
    StateNotifierProvider<ConditionPickerNotifier, ConditionPickerModel>((ref) {
  return ConditionPickerNotifier();
});
