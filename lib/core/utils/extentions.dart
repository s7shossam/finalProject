import 'package:flutter/material.dart';

const double baseWidth = 375;
const double baseHeight = 812;

extension SizeExtension on BuildContext {
  double responsiveWidth(double width) {
    return (width / baseWidth) * MediaQuery.of(this).size.width;
  }

  double responsiveHeight(double height) {
    return (height / baseHeight) * MediaQuery.of(this).size.height;
  }

  double responsiveFontSize(double fontSize) {
    return (fontSize / baseWidth) * MediaQuery.of(this).size.width;
  }

  double responsiveRadius(double radius) {
    return (radius / baseWidth) * MediaQuery.of(this).size.width;
  }
}
