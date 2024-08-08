import 'package:flutter/widgets.dart';
import 'package:kidbank/core/models/toy_property.dart';


sealed class Categories {
  static final ToyProperty softFriends = ToyProperty(
      name: 'Soft Friends', image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final ToyProperty blocksPuzzles = ToyProperty(name: 'Blocks & Puzzles', image: ToyProperty.assetImage('assets/images/puzzle.png'));
  static final ToyProperty toyCars = ToyProperty(name: 'Toy Cars', image: ToyProperty.assetImage('assets/images/car.png'));
  static final ToyProperty boardGames = ToyProperty(name: 'Board Games', image: ToyProperty.assetImage('assets/images/board_game.png'));
  static final ToyProperty artTime = ToyProperty(name: 'Art Time', image: ToyProperty.assetImage('assets/images/art.png'));
  static final ToyProperty dolls = ToyProperty(name: 'Dolls', image: ToyProperty.assetImage('assets/images/doll.png'));
  static final ToyProperty musicalToys = ToyProperty(name: 'Musical Toys', image: ToyProperty.assetImage('assets/images/music.png'));
  static final ToyProperty undefined = ToyProperty(name: 'I\'m not sure', image: ToyProperty.assetImage('assets/images/not_sure.png'));
  static List<ToyProperty> values=[softFriends,blocksPuzzles,toyCars,boardGames,artTime,dolls,musicalToys,undefined];
}