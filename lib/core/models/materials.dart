import 'package:kidbank/core/models/toy_property.dart';

sealed class Materials{
  static final wooden=ToyProperty(name:'Wooden',image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final textile=ToyProperty(name:'Textiles',image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final plastic=ToyProperty(name:'Plastic',image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final metal=ToyProperty(name:'Metal',image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final undefined=ToyProperty(name:'I\'m not sure',image: ToyProperty.assetImage('assets/images/not_sure.png'));

  static List<ToyProperty> values=[wooden,textile,plastic,metal,undefined];
}