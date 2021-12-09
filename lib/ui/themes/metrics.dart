//
// @author thinhth on 12/03/2021
//

import 'package:flutter/material.dart';

class MyMetrics {
  static double spacingXS = 4.0;
  static double spacingS = 8.0;
  static double spacingM = 12.0;
  static double spacingL = 16.0;
  static double spacingXL = 20.0;
  static double spacingXXL = 24.0;

  static double defaultIconSize = 24.0;

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getTopPadding(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double getBottomPadding(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double width(double size) {
    return size;
  }

  static double height(double size) {
    return size;
  }
}
