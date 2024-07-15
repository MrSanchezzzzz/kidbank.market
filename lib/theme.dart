import 'package:flutter/cupertino.dart';

import 'core/colors.dart';

CupertinoThemeData defaultTheme = CupertinoThemeData(
    barBackgroundColor: const Color(0xFFF3EDFF),
    scaffoldBackgroundColor: Colors.purple50,
    textTheme: const CupertinoTextThemeData(
        textStyle: TextStyle(fontFamily: 'Lato', fontSize: 17, color: Color(0xFF000000)),
        navActionTextStyle: TextStyle(fontFamily: 'Lato', fontSize: 17, color: Color(0xFF612FB1)),
        navTitleTextStyle: TextStyle(fontFamily: 'Lato',fontSize: 17,fontWeight: FontWeight.w700,color: Color(0xFF000000)),
        navLargeTitleTextStyle: TextStyle(fontFamily: 'Lato',fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xFF000000)),
    )
);
