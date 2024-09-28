

import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

FutureProvider<List<String>> surveyOptionsProvider=FutureProvider<List<String>>((ref) async{
  Random rnd=Random();
  await Future.delayed(Duration(seconds: rnd.nextInt(3)+1));
  return [
    'Sell child\'s toys',
    'Buy toys for the child',
    'Supervise the sale of toys by the child',
    'Supervise the child\'s purchase of toys',
    'Teaching children financial literacy',
    'Other',
  ];
});