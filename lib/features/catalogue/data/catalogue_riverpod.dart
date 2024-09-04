
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

FutureProvider<int> catalogueProvider=FutureProvider<int>((ref) async{
  Random rnd=Random();
  await Future.delayed(Duration(seconds: rnd.nextInt(7)+2));
  return 0;
});