import 'package:flutter/widgets.dart';

/* margin */

const double spacing_control_half = 2.0;
const double spacing_control = 4.0;
const double spacing_standard = 8.0;
const double spacing_middle = 10.0;
const double spacing_standard_new = 16.0;
const double spacing_large = 24.0;
const double spacing_xlarge = 32.0;
const double spacing_xxLarge = 40.0;

class IchinsanSizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    // On iPhone 11 the defaultSize = 10 almost
    // So if the screen size increase or decrease then our defaultSize also vary
    defaultSize = orientation == Orientation.landscape
        ? screenHeight * 0.024
        : screenWidth * 0.024;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = IchinsanSizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = IchinsanSizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
