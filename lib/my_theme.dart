
import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryColor = const Color(0xff39A552);
  static Color grayColor = const Color(0x54353232);
  static Color blueColor = const Color(0xff003E90);
  static Color redColor = const Color(0xffC91C22);
  static Color pinkColor = const Color(0xffED1E79);
  static Color brownColor = const Color(0xffCF7E48);
  static Color yellowColor = const Color(0xffF2D352);
  static Color babyBlueColor = const Color(0xff4882CF);

 static ThemeData lightTheme = ThemeData(

    appBarTheme: AppBarTheme(
      color: primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
    ),
    primaryColor: primaryColor,
  );
}
