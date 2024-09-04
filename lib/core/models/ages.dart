import 'package:kidbank/core/models/toy_property.dart';


sealed class Ages{
  static final two=ToyProperty(name:'0-2 years',image: ToyProperty.assetImage('assets/images/0-2.png'));
  static final five=ToyProperty(name:'3-5 years',image: ToyProperty.assetImage('assets/images/3-5.png'));
  static final eight=ToyProperty(name:'6-8 years',image: ToyProperty.assetImage('assets/images/6-8.png'));
  static final twelve=ToyProperty(name:'9-12 years',image: ToyProperty.assetImage('assets/images/9-12.png'));
  static final thirteen=ToyProperty(name:'13+ years',image: ToyProperty.assetImage('assets/images/13+.png'));
  static final undefined=ToyProperty(name:'I\'m not sure',image: ToyProperty.assetImage('assets/images/not_sure.png'));
  static List<ToyProperty> values=[two,five,eight,twelve,thirteen,undefined];
}

