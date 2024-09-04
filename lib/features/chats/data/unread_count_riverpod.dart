
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

FutureProvider<int> unreadCountProvider=FutureProvider<int>((ref) async{
  Random rnd=Random();
  await Future.delayed(Duration(seconds: rnd.nextInt(3)+1));
  return rnd.nextInt(10)+1;
});

