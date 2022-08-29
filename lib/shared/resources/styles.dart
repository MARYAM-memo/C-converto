import 'package:cconvert/shared/resources/colors.dart';
import 'package:flutter/material.dart';

TextStyle appTextStyle({
  required double size,
  required weight,
  required color,
}) {
  return TextStyle(fontSize: size, fontWeight: weight, color: color);
}

TextStyle getRegular({color = black}) {
  return appTextStyle(size: 18, weight: FontWeight.w500, color: color);
}
