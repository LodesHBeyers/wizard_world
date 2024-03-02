
import 'package:flutter/widgets.dart';

class AppSizes {
  static double sw (BuildContext context) => MediaQuery.of(context).size.width;

  static double sh (BuildContext context) => MediaQuery.of(context).size.height;

  /// 4
  static const double xxs = 4;
  /// 8
  static const double xs = 8;
  /// 16
  static const double s = 16;
  /// 20
  static const double m = 20;
  /// 24
  static const double l = 24;
  /// 28
  static const double xl = 28;
  /// 32
  static const double xxl = 32;
}