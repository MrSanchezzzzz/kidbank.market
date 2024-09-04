
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

FutureProvider<int> favoritesProvider=FutureProvider<int>((ref) async{
  Random rnd=Random();
  Future.delayed(Duration(seconds: rnd.nextInt(7)+2));
  return 0;
});