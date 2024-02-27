import 'package:flutter/material.dart';
import 'package:wizard_world/theme/house_themes.dart/house_theme.dart';

class RavenclawTheme extends HouseTheme {
  @override

  /// Blue
  Color get primary => const Color.fromARGB(255, 0, 0, 175);

  @override

  /// Bronze
  Color get secondary => const Color(0xffCD7F32);

  @override
  Color get accent1 => const Color.fromARGB(255, 199, 139, 79);

  @override
  Color get accent2 => const Color.fromARGB(255, 211, 161, 111);

  @override
  Color get accent3 => const Color.fromARGB(255, 230, 193, 156);
}
