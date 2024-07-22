import 'package:flutter/widgets.dart';

class Age{
  const Age({required this.name,required this.image});
  final String name;
  final Image image;
}

sealed class Ages{
  static final two=Age(name:'0-2 years',image: _ageImage('assets/images/0-2.png'));
  static final five=Age(name:'3-5 years',image: _ageImage('assets/images/3-5.png'));
  static final eight=Age(name:'6-8 years',image: _ageImage('assets/images/6-8.png'));
  static final twelve=Age(name:'9-12 years',image: _ageImage('assets/images/9-12.png'));
  static final thirteen=Age(name:'13+ years',image: _ageImage('assets/images/13+.png'));
  static final undefined=Age(name:'I\'m not sure',image: _ageImage('assets/images/not_sure.png'));
  static List<Age> values=[two,five,eight,twelve,thirteen,undefined];
}

Image _ageImage(String path)=>Image.asset(path,width: 44,height: 44,);
