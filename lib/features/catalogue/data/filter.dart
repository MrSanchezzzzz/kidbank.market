import 'dart:ui';

import 'package:kidbank/core/models/toy_property.dart';


class Filter{
  static const int minPrice=0;
  static const int maxPrice=100;
  static const int minPriceDelta=0;

  late List<ToyProperty> categories;
  late List<ToyProperty> ages;
  late bool tradability;
  late List<ToyProperty> conditions;
  late List<Color> colors;
  late (int,int) prices;

  Filter(){
    categories=[];
    ages=[];
    tradability=true;
    conditions=[];
    colors=[];
    prices=(0,100);
  }

  int get count {
    List<bool> conditions = [
      categories.isNotEmpty,
      ages.isNotEmpty,
      colors.isNotEmpty,
      prices.$1 != 0,
      prices.$2 != 100
    ];

    return conditions.fold(0, (sum, condition) => sum + (condition ? 1 : 0));
  }


  Filter copyWith({
    List<ToyProperty>? categories,
    List<ToyProperty>? ages,
    bool? tradability,
    List<ToyProperty>? conditions,
    List<Color>? colors,
    (int,int)? prices,
  }) {
    return Filter()
      ..categories = categories ?? this.categories
      ..ages = ages ?? this.ages
      ..tradability=tradability??this.tradability
      ..conditions=conditions??this.conditions
      ..colors = colors ?? this.colors
      ..prices = prices ?? this.prices;
  }
}