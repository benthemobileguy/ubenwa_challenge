import 'package:flutter/material.dart';
import 'package:ubenwa_challenge/resources/font-manager.dart';


TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color,) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight,);
}

// regular style

TextStyle getTextStyle(
    {double fontSize = FontSize.s12,  Color? color, FontWeight? fontWeight}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, fontWeight!, color!,);
}
// light text style

TextStyle getLightStyle(
    {double fontSize = FontSize.s12, Color? color,}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color!,);
}

TextStyle getAppBarStyle(
    {double fontSize = FontSize.s12, Color? color,}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeight.w500,
    color!,);
}