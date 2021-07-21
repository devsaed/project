import 'package:flutter/material.dart';

class SizeConfig {
  static double?  screenWidth;
  static double? _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double? _textMultiplier;
  static double? _imageSizeMultiplier;
  static double? _heightMultiplier;
  static double? _widthMultiplier;
  static double? _deviceRatio;
  // static bool isPortrait = true;
  // static bool isMobilePortrait = false;

  static MediaQueryData? _mediaQueryData;

  void init(BuildContext context) {

    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    _screenHeight = _mediaQueryData!.size.height;

    _blockWidth = screenWidth! / 100;
    _blockHeight = _screenHeight! / 100;

    _textMultiplier = _blockHeight;
    _imageSizeMultiplier = _blockWidth;
    _heightMultiplier = _blockHeight;
    _widthMultiplier = _blockWidth;
    _deviceRatio = screenWidth! / _screenHeight!;
  }

  static double scaleTextFont(double fontSize) {
    double scale = fontSize / 9.76;
    return (_textMultiplier! * scale);
  }

  static double scaleWidth(double width) {
    double scale = width / 4.14;
    return (_widthMultiplier! * scale);
  }

  static double scaleHeight(double height) {
    double scale = height / 8.96;
    return (_heightMultiplier! * scale);
  }
}
