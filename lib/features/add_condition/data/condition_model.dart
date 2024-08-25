class Condition {
  final String label;

  Condition({required this.label});
}
class ConditionPickerModel {
  final Condition? firstCondition;
  final Condition? secondCondition;

  ConditionPickerModel({this.firstCondition, this.secondCondition});

  int get selectedCount {
    int count = 0;
    if (firstCondition != null) count++;
    if (secondCondition != null) count++;
    return count;
  }

  bool isSelected(String conditionlLabel) {
    return firstCondition?.label == conditionlLabel ||
        secondCondition?.label == conditionlLabel;
  }

  ConditionPickerModel copyWith(
      {Condition? firstCondition, Condition? secondCondition}) {
    return ConditionPickerModel(
      firstCondition: firstCondition ?? firstCondition,
      secondCondition: secondCondition ?? secondCondition,
    );
  }
}