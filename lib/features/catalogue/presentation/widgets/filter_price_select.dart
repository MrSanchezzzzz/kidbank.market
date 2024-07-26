import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/core/utils/input_formatters.dart';
import 'package:kidbank/core/widgets/custom_text_field.dart';
import 'package:kidbank/features/catalogue/data/filter_riverpod.dart';

import '../../../../core/widgets/custom_range_slider.dart';
import '../../../../core/colors.dart';
import '../../data/filter.dart';

class FilterPriceSelect extends ConsumerStatefulWidget {
  const FilterPriceSelect({super.key});

  @override
  ConsumerState<FilterPriceSelect> createState() => _FilterPriceSelectState();
}

class _FilterPriceSelectState extends ConsumerState<FilterPriceSelect> {
  late TextEditingController minPriceController;
  late TextEditingController maxPriceController;
  Timer? _debounceTimer;

  @override
  void initState() {
    minPriceController = TextEditingController();
    minPriceController.addListener(handleMinPrice);

    maxPriceController=TextEditingController();
    maxPriceController.addListener(handleMaxPrice);
    super.initState();
  }

  void handleMinPrice(){
      int min= minPriceController.text.isNotEmpty?int.parse(minPriceController.text):Filter.minPrice;
      int max=ref.read(filterProvider).prices.$2;
      ref.read(filterProvider.notifier).setPrices(min, max);
  }

  void handleMaxPrice(){
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 750), () {
      int min=ref.read(filterProvider).prices.$1;
      int max= maxPriceController.text.isNotEmpty?int.parse(maxPriceController.text):Filter.maxPrice;
      if(max<=min){
        max=min;
        maxPriceController.text=max.toString();
      }
      ref
          .read(filterProvider.notifier)
          .setPrices(min,max);
    });
  }

  @override
  Widget build(BuildContext context) {
    (int,int) prices=ref.watch(filterProvider).prices;
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        'Price',
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
              fontSize: 15,
              color: Colors.grey500,
            ),
        textAlign: TextAlign.left,
      ),
      CustomRangeSlider(
        onChanged: (min, max) {
          ref.read(filterProvider.notifier).setPrices(min.round(), max.round());
          minPriceController.text = min.round().toString();
          maxPriceController.text = max.round().toString();
        },
        textPrefix: '\$',
        min: 0,
        max: 100,
        values: (prices.$1.toDouble(),prices.$2.toDouble()),
      ),
      const SizedBox(
        height: 8,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: ((MediaQuery.of(context).size.width - 32) / 2) - 8,
              child: CustomTextField(
                label: 'From',
                placeholder: '\$1',
                controller: minPriceController,
                formatters: [
                  FilterMinPriceFormatter(ref: ref)
                ],
              )),
          SizedBox(
              width: ((MediaQuery.of(context).size.width - 32) / 2) - 8,
              child: CustomTextField(
                label: 'To',
                placeholder: '\$100',
                controller: maxPriceController,
              )),
        ],
      ),
      SizedBox(
        height: MediaQuery.of(context).viewInsets.bottom,
      )
    ]);
  }
}
