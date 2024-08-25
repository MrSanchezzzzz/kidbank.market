import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';
import 'package:kidbank/core/widgets/custom_check_box.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/add_color/presentation/widgets/row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ToyMaterial {
  final String label;

  ToyMaterial({required this.label});
}

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
    return firstMaterial?.label == materialLabel || secondMaterial?.label == materialLabel;
  }

  ToyMaterialPickerModel copyWith({ToyMaterial? firstMaterial, ToyMaterial? secondMaterial}) {
    return ToyMaterialPickerModel(
      firstMaterial: firstMaterial ?? this.firstMaterial,
      secondMaterial: secondMaterial ?? this.secondMaterial,
    );
  }
}


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
    } else if (state.selectedCount < 2) {
      selectMaterial(material);
    }
  }
}



final selectedMaterialsProvider =
    StateNotifierProvider<ToyMaterialPickerNotifier, ToyMaterialPickerModel>((ref) {
  return ToyMaterialPickerNotifier();
});


class SetToyMaterial extends ConsumerWidget {
  const SetToyMaterial({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMaterials = ref.watch(selectedMaterialsProvider);

    final List<Map<String, dynamic>> materials = [
      {'icon': toyTree, 'label': 'Wooden'},
      {'icon': toyTree, 'label': 'Textiles'},
      {'icon': toyTree, 'label': 'Plastic'},
      {'icon': toyTree, 'label': 'Metal'},
      {'icon': toyTree, 'label': "I'm not sure"},
    ];

    int chosenToyMaterial = selectedMaterials.selectedCount;

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainBackButton(label: 'Back'),
          ],
        ),
        border: Border(bottom: BorderSide.none),
        backgroundColor: Color(0xfff3edff),
        middle: Text('Add Material'),
      ),
      backgroundColor: Colors.white100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomRow(
            title: "What's your toy made from?",
            fSize: 24,
            clr: Colors.grey500,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 20),
          CustomRow(
            title: chosenToyMaterial > 0
                ? 'You have chosen $chosenToyMaterial material${chosenToyMaterial == 1 ? '' : 's'}.'
                : "Pick up to 2 variants or choose 'I'm not sure' if\nyou don't know.",
            fSize: 17,
            clr: chosenToyMaterial > 0 ? Colors.purple700 : Colors.grey500,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.grey100,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.9,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: materials.length,
                itemBuilder: (context, index) {
                  final material = materials[index];
                  final String label = material['label'] as String;
                  final icon = material['icon'] as Image; // Assuming it's an Image widget
                  final isSelected = selectedMaterials.isSelected(label);

                  return GestureDetector(
                    onTap: () {
                      final toyMaterial = ToyMaterial(label: label);
                      ref.watch(selectedMaterialsProvider.notifier).toggleMaterial(toyMaterial);
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected ? Colors.toyBlue : Colors.grey100,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                icon,
                                const SizedBox(height: 8),
                                Text(label),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: CustomCheckBox(
                            value: isSelected,
                            onChanged: (bool? value) {
                              final toyMaterial = ToyMaterial(label: label);
                              ref.watch(selectedMaterialsProvider.notifier).toggleMaterial(toyMaterial);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          MainButton(
            text: 'Confirm',
            color: chosenToyMaterial == 2 ? Colors.orange300 : Colors.grey100,
            onTap: chosenToyMaterial == 2 ? () {} : null,
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
