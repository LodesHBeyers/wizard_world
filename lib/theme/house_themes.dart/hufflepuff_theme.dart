import 'package:flutter/material.dart';
import 'package:wizard_world/theme/house_themes.dart/house_theme.dart';

class HufflepuffTheme extends HouseTheme {
  @override

  /// Yellow
  Color get primary => const Color.fromARGB(255, 175, 161, 0);

  @override

  /// Black
  Color get secondary => const Color(0xff000000);

  @override
  Color get accent1 => const Color.fromARGB(255, 65, 65, 65);

  @override
  Color get accent2 => const Color.fromARGB(255, 141, 141, 141);

  @override
  Color get accent3 => const Color.fromARGB(255, 197, 197, 197);
}