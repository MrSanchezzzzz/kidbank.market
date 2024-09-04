import 'package:flutter_riverpod/flutter_riverpod.dart';

final orangeStarsProvider = StateProvider<double>((ref) {
  return 4.0;
});

final productStarsProvider = StateProvider<double>((ref) {
  return 1.0;
});
final deadlinesStarsProvider = StateProvider<double>((ref) {
  return 1.0;
});
final communicationStarsProvider = StateProvider<double>((ref) {
  return 1.0;
});