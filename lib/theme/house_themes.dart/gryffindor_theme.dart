import 'package:flutter/material.dart';
import 'package:wizard_world/theme/house_themes.dart/house_theme.dart';

class GryffindorTheme extends HouseTheme {
  @override

  /// Scarlet
  Color get primary => const Color(0xffFF2400);

  @override

  /// Gold
  Color get secondary => const Color(0xffFFD700);

  @override
  Color get accent1 => Color.fromARGB(255, 255, 234, 113);

  @override
  Color get accent2 => Colors.white;

  @override
  Color get accent3 => Colors.white;
}
