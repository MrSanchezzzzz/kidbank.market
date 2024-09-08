import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/images.dart';
import 'package:kidbank/core/widgets/custom_check_box.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/add_toys_color/presentation/widgets/row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kidbank/features/add_toys_condition/data/condition_model.dart';
import 'package:kidbank/features/add_toys_condition/data/condition_provider.dart';

class AddConditions extends ConsumerWidget {
  const AddConditions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCondition = ref.watch(selectedConditionProvider);

    final List<Map<String, dynamic>> materials = [
      {'icon': conditionPrize, 'label': 'New'},
      {'icon': conditionLikeNew, 'label': 'Like new'},
      {'icon': conditionRefresh, 'label': 'Used'},
      {'icon': conditionRenewed, 'label': 'Renewed'},
     
    ];

    int chosenCondition = selectedCondition.selectedCount;

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
        middle: Text(
          'Add conditon',
        ),
      ),
      backgroundColor: Colors.white100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomRow(
            title: "Item condition?",
            fSize: 24,
            clr: Colors.grey500,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 20),
          CustomRow(
            title: chosenCondition <= 0
                ? "You've selected a New condition of the toy"
                : "Pick 1 category or select 'I'm not sure' if you're \n uncertain",
            fSize: 17,
            clr: Colors.grey500,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 20),

          // Line
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
                  final icon = material['icon'] as Image;
                  final isSelected = selectedCondition.isSelected(label);
                  final checked = isSelected;

                  return GestureDetector(
                    onTap: () {
                      final condition = Condition(label: label);
                      ref
                          .read(selectedConditionProvider.notifier)
                          .toggleCondition(condition);
                    },
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: checked ? Colors.purple200 : Colors.white100,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: checked
                                    ? Colors.purple400
                                    : Colors.grey100),
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
                            value: checked,
                            onChanged: (bool? value) {
                              final condition = Condition(label: label);
                              if (value == true) {
                                ref
                                    .read(selectedConditionProvider.notifier)
                                    .selectMaterial(condition);
                              } else {
                                ref
                                    .read(selectedConditionProvider.notifier)
                                    .deselectMaterial(condition);
                              }
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
            color: chosenCondition >= 1 ? Colors.orange300 : Colors.grey100,
            onTap: chosenCondition >= 1 ? () {} : null,
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
