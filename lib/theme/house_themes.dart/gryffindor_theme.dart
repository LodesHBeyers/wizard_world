import 'package:flutter/material.dart';
import 'package:wizard_world/theme/house_themes.dart/house_theme.dart';

class GryffindorTheme extends HouseTheme {
  @override

  /// Scarlet
  Color get primary => const Color.fromARGB(255, 192, 26, 0);

  @override

  /// Gold
  Color get secondary => const Color(0xffFFD700);

  @override
  Color get accent1 => const Color.fromARGB(255, 255, 226, 65);

  @override
  Color get accent2 => const Color.fromARGB(255, 255, 235, 119);

  @override
  Color get accent3 => const Color.fromARGB(255, 255, 241, 161);
}
