import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = const Color(0xFFFF7643);
  static Color lightPrimary = const Color(0xFFFFECDF);
  static Color darkGrey = const Color(0xff525252);
  static Color black = const Color(0xff000000);
  static Color discountColor = const Color(0xFF4A3298);
  static Color gray = const Color(0xff737477);
  static Color lightGray = const Color(0xFFF5F6F9);
  static Color secondaryColor = const Color(0xFF979797);
  static Color white = const Color(0xffffffff);
  static Color background = const Color(0xffF5F5F5);
  static Color red = const Color(0xffe61f34);

  static final gradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF343434).withOpacity(0.4),
      const Color(0xFF343434).withOpacity(0.15),
    ],
  );
}
