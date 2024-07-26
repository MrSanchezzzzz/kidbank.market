import 'dart:ui';

import '../../../core/models/ages.dart';
import '../../../core/models/categories.dart';


class Filter{
  static const int minPrice=0;
  static const int maxPrice=100;
  static const int minPriceDelta=0;

  late List<Category> categories;
  late List<Age> ages;
  late List<Color> colors;
  late (int,int) prices;

  Filter(){
    categories=[];
    ages=[];
    colors=[];
    prices=(0,100);
  }

  Filter copyWith({
    List<Category>? categories,
    List<Age>? ages,
    List<Color>? colors,
    (int,int)? prices,
  }) {
    return Filter()
      ..categories = categories ?? this.categories
      ..ages = ages ?? this.ages
      ..colors = colors ?? this.colors
      ..prices = prices ?? this.prices;
  }
}