class ToyMaterialPickerModel {
  final ToyMaterial? firstMaterial;
  final ToyMaterial? secondMaterial;

  ToyMaterialPickerModel({this.firstMaterial, this.secondMaterial});

  // Getter to count the number of selected materials
  int get selectedCount {
    int count = 0;
    if (firstMaterial != null) count++;
    if (secondMaterial != null) count++;
    return count;
  }

  // Method to check if a specific material is selected
  bool isSelected(String materialLabel) {
    return firstMaterial?.label == materialLabel || secondMaterial?.label == materialLabel;
  }

  // Method to copy with updated values
  ToyMaterialPickerModel copyWith({ToyMaterial? firstMaterial, ToyMaterial? secondMaterial}) {
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
