//
// @author thinhth on 12/03/2021
//

import 'package:flutter/material.dart';

class MyColors {
  static Color white = colorFromHex("ffffff");
  static Color black = colorFromHex("000000");
  static Color grey = colorFromHex("#ded3b4");
  static Color green = colorFromHex("#17631f");
}

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
