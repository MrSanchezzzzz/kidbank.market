import 'package:flutter/widgets.dart';

class ToyProperty{
  ToyProperty({required this.name,required this.image});
   final String name;
   final Image image;

   static Image assetImage(String path){
     return Image.asset(path,width: 44,height: 44,);
   }
}