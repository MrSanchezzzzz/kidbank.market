import 'package:flutter/services.dart';

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