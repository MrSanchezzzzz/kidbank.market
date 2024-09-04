import 'package:flutter/cupertino.dart';

class ToyColors{
  static const ToyColor white=ToyColor(name: 'White', color: Color(0xFFFFFFFF));
  static const ToyColor black=ToyColor(name: 'Black', color: Color(0xFF000000));
  static const ToyColor brown=ToyColor(name: 'Brown', color: Color(0xFF845D32));
  static const ToyColor green=ToyColor(name: 'Green', color: Color(0xFF007328));
  static const ToyColor grey=ToyColor(name: 'Grey', color: Color(0xFFA7A7A7));
  static const ToyColor pink=ToyColor(name: 'White', color: Color(0xFFFFC0CB));
  static const ToyColor purple=ToyColor(name: 'Purple', color: Color(0xFF9A339C));
  static const ToyColor yellow=ToyColor(name: 'Yellow', color: Color(0xFFFFEC42));
  static const ToyColor blue=ToyColor(name: 'Blue', color: Color(0xFF00BFFE));
  static const ToyColor red=ToyColor(name: 'Red', color: Color(0xFFFF0909));
  static const ToyColor colorful=ToyColor(name: 'Colorful', color: null);
}

class ToyColor{
  const ToyColor({required this.name,required this.color});
  final String name;
  final Color? color;
}