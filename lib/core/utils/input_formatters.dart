import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kidbank/features/catalogue/data/filter.dart';
import 'package:kidbank/features/catalogue/data/filter_riverpod.dart';

class MoneyInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'^\d+(\.\d{0,2})?$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class DigitsInputFormatter extends TextInputFormatter {
  final RegExp _regExp = RegExp(r'^\d*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_regExp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class FilterMinPriceFormatter extends TextInputFormatter {
  FilterMinPriceFormatter({required this.ref});
  late final WidgetRef ref;
  final RegExp _regExp = RegExp(r'^\d*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
      if(newValue.text.isEmpty){
        return newValue;
      }
      if (_regExp.hasMatch(newValue.text)) {
        (int, int) prices = ref
            .read(filterProvider)
            .prices;
        int minPrice = int.parse(newValue.text);
        if ((prices.$2-minPrice) >= Filter.minPriceDelta) {
          return newValue;
        }
      }
    return oldValue;
  }
}

class FilterMaxPriceFormatter extends TextInputFormatter {
  FilterMaxPriceFormatter({required this.ref});
  late final WidgetRef ref;
  final RegExp _regExp = RegExp(r'^\d*$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.isEmpty){
      return newValue;
    }
    if (_regExp.hasMatch(newValue.text)) {
      (int, int) prices = ref
          .read(filterProvider)
          .prices;
      double maxPrice = double.parse(newValue.text);
      if ((maxPrice - prices.$1) >= Filter.minPriceDelta) {
        return newValue;
      }
    }
    return oldValue;
  }
}