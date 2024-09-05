import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Colors;
import 'package:kidbank/core/colors.dart' as AppColors;
import 'package:kidbank/core/widgets/main_button.dart';
import '../../../../core/images.dart';
import '../../../../core/widgets/custom_radio_button.dart';
import '../../../../core/widgets/filter/sort_button.dart';

class RatingSort extends StatefulWidget {
  const RatingSort({super.key});

  @override
  _RatingSortState createState() => _RatingSortState();
}

class _RatingSortState extends State<RatingSort> {
  int _selectedSortOption = 0;
  final List<String> _sortOptions = [
    'From the newest to the oldest',
    'From the oldest to the newest',
    'From the best to the worst ratings',
    'From the worst to the best ratings',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SortButton(
            sortBy: _sortOptions[_selectedSortOption].toLowerCase(),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return _buildSortingSheet(context);
                },
                isScrollControlled: true,
                isDismissible: true,
                enableDrag: true,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSortingSheet(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      child: CupertinoPageScaffold(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Sorting',
                        style: CupertinoTheme
                            .of(context)
                            .textTheme
                            .textStyle
                            .copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: SizedBox(width: 16, height: 16, child: back_cross),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < _sortOptions.length; i++)
                  Padding(
                    padding: EdgeInsets.only(left: 12, top: i == 0 ? 0 : 16, right: 16),
                    child: CustomRadioButton(
                      label: _sortOptions[i],
                      value: i,
                      groupValue: _selectedSortOption,
                      onChanged: (int? value) {
                        if (value != null) {
                          setState(() {
                            _selectedSortOption = value;
                          });
                        }
                      },
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MainButton(
                text: 'Apply',
                color: AppColors.Colors.orange300,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}