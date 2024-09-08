import 'package:flutter/cupertino.dart';
import 'package:kidbank/core/colors.dart';
import 'package:kidbank/core/widgets/main_back_button.dart';
import 'package:kidbank/core/widgets/main_button.dart';
import 'package:kidbank/features/add_toys_color/data/color_picker_riverpod.dart';
import 'package:kidbank/features/add_toys_color/presentation/widgets/row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetToyColors extends ConsumerWidget {
  const SetToyColors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the current state to determine selected colors
    final colorPicker = ref.watch(colorPickerProvider);

    Widget buildColorButton(BuildContext context, Color color,
        {required bool isFirstColor}) {
      // Determine if this color is selected
      final selected = isFirstColor
          ? color == colorPicker.firstColor
          : color == colorPicker.secondColor;

      return GestureDetector(
        onTap: () {
          final notifier = ref.read(colorPickerProvider.notifier);
          if (isFirstColor) {
            notifier.selectFirstColor(color);
          } else {
            notifier.selectSecondColor(color);
          }
        },
        child: Container(
          margin: const EdgeInsets.all(4),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(
              color: selected ? Colors.grey200 : Colors.grey100,
              width: selected ? 3 : 1,
            ),
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(selected ? 3 : 0),
        ),
      );
    }

    // List of predefined toy colors for better scalability
    final List<Color> toyColors = [
      Colors.toyWhite,
      Colors.toyBlack,
      Colors.toyBrown,
      Colors.toyGreen,
      Colors.toyGrey,
      Colors.toyPink,
      Colors.toyPurple,
      Colors.toyYellow,
      Colors.grey500,  // TODO: Make this colorful dynamically if needed
      Colors.toyBlue,
      Colors.toyRed,
    ];

    // Calculate how many colors have been chosen
    int chosenColors = 0;
    if (colorPicker.firstColor != null) chosenColors++;
    if (colorPicker.secondColor != null) chosenColors++;

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
        middle: Text('Select color'),
      ),
      backgroundColor: Colors.white100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomRow(
              title: 'What color is your toy?',
              fSize: 24,
              clr: Colors.grey500,
              fontWeight: FontWeight.w700,
            ),
            const SizedBox(height: 20),
            CustomRow(
              title: chosenColors > 0
                  ? 'You have chosen $chosenColors color${chosenColors == 1 ? '' : 's'}.'
                  : 'Pick a color',
              fSize: 18,
              clr: chosenColors > 0 ? Colors.purple700:Colors.grey500,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 20,
              runSpacing: 20,
              children: toyColors.map((color) {
                final isFirstColor = color == Colors.toyWhite ||
                    color == Colors.toyBrown ||
                    color == Colors.toyGrey ||
                    color == Colors.toyPurple ||
                    color == Colors.toyBlue;
                return buildColorButton(context, color, isFirstColor: isFirstColor);
              }).toList(),
            ),
            const SizedBox(height: 30),
            MainButton(
              text: 'Confirm',
              color: chosenColors == 2 ? Colors.orange300 : Colors.grey100, 
              onTap: chosenColors > 1
                  ? () {
                      
                    }
                  : null, 
            ),
          ],
        ),
      ),
    );
  }
}
