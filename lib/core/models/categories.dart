import 'package:flutter/widgets.dart';

class Category {
  const Category({required this.name, required this.image});

  final String name;
  final Image image;
  bool equals(Category other)=>name==other.name;
}

Image _categoryImage(String path) => Image.asset(path, width: 44, height: 44,);

sealed class Categories {
  static final Category softFriends = Category(
      name: 'Soft Friends', image: _categoryImage('assets/images/teddybear.png'));
  static final Category blocksPuzzles = Category(name: 'Blocks & Puzzles', image: _categoryImage('assets/images/puzzle.png'));
  static final Category toyCars = Category(name: 'Toy Cars', image: _categoryImage('assets/images/car.png'));
  static final Category boardGames = Category(name: 'Board Games', image: _categoryImage('assets/images/board_game.png'));
  static final Category artTime = Category(name: 'Art Time', image: _categoryImage('assets/images/art.png'));
  static final Category dolls = Category(name: 'Dolls', image: _categoryImage('assets/images/doll.png'));
  static final Category musicalToys = Category(name: 'Musical Toys', image: _categoryImage('assets/images/music.png'));
  static final Category undefined = Category(name: 'I\'m not sure', image: _categoryImage('assets/images/not_sure.png'));
  static List<Category> values=[softFriends,blocksPuzzles,toyCars,boardGames,artTime,dolls,musicalToys,undefined];
}