class ToyMaterialPickerModel {
  final ToyMaterial? firstMaterial;
  final ToyMaterial? secondMaterial;

  ToyMaterialPickerModel({this.firstMaterial, this.secondMaterial});

  int get selectedCount {
    int count = 0;
    if (firstMaterial != null) count++;
    if (secondMaterial != null) count++;
    return count;
  }

  bool isSelected(String materialLabel) {
    return firstMaterial?.label == materialLabel ||
        secondMaterial?.label == materialLabel;
  }

  ToyMaterialPickerModel copyWith(
      {ToyMaterial? firstMaterial, ToyMaterial? secondMaterial}) {
    return ToyMaterialPickerModel(
      firstMaterial: firstMaterial ?? this.firstMaterial,
      secondMaterial: secondMaterial ?? this.secondMaterial,
    );
  }
}

class ToyMaterial {
  final String label;

  ToyMaterial({required this.label});
}
