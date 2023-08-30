import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericRangeFormatter extends TextInputFormatter {

  final double min;
  final double max;

  NumericRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {


    if(newValue.text.length > max.toString().length) {
      String text = newValue.text.replaceRange( newValue.text.length - 2, newValue.text.length - 1, '');
      newValue = copyWith(TextEditingValue(text: text));
    }

    final oldValueNumber =  double.tryParse(oldValue.text);
    final newValueNumber = double.tryParse(newValue.text);

    if (newValueNumber == null) {
      return copyWith(newValue, min.toString());
    }
    if(oldValueNumber == min) {
      return copyWith(newValue, newValueNumber.toString().replaceAll(oldValue.text, ''));
    }


    if (newValueNumber < min) {
      return copyWith(newValue, min.toString());
    } else if (newValueNumber > max) {
      return copyWith(newValue, max.toString());
    } else {
      return copyWith(newValue);
    }
  }
  TextEditingValue copyWith(TextEditingValue value, [String? text]) {
    text ??= value.text;
    return  value.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.toString().length),
    );
  }
}