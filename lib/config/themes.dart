import 'package:cconvert/shared/resources/colors.dart';
import 'package:cconvert/shared/resources/styles.dart';
import 'package:flutter/material.dart';

ThemeData appThemeData({
  required color,
  required xcolor,
}) {
  return ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: primary,
          foregroundColor: white,
          titleTextStyle: getRegular(color: white),
          centerTitle: true,
          titleSpacing: .5),
      scaffoldBackgroundColor: color,
      textSelectionTheme: TextSelectionThemeData(cursorColor: xcolor),
      drawerTheme: DrawerThemeData(
        backgroundColor: color,
        width: 300,
      ));
}

ThemeData getLight() {
  return appThemeData(color: white, xcolor: black);
}

ThemeData getDark() {
  return appThemeData(color: black, xcolor: white);
}
