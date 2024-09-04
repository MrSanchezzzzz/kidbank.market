
import 'package:kidbank/core/models/toy_property.dart';

sealed class Conditions{
  static final New=ToyProperty(name:'New',image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final likeNew=ToyProperty(name:'Like new',image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final used=ToyProperty(name:'Used',image: ToyProperty.assetImage('assets/images/teddybear.png'));
  static final renewed=ToyProperty(name:'Renewed',image: ToyProperty.assetImage('assets/images/teddybear.png'));

  static List<ToyProperty> values=[New,likeNew,used,renewed];
}

