import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = _mediaQueryData;
  static double screenWidth = defaultSize;
  static double screenHeight = defaultSize;
  static double defaultSize = defaultSize;
  static Orientation orientation = SizeConfig.orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}
