import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/presentation/components/assets/app_fonts.dart';
import 'package:wizard_world/theme/house_themes.dart/gryffindor_theme.dart';
import 'package:wizard_world/theme/house_themes.dart/house_theme.dart';
import 'package:wizard_world/theme/house_themes.dart/hufflepuff_theme.dart';
import 'package:wizard_world/theme/house_themes.dart/ravenclaw_theme.dart';
import 'package:wizard_world/theme/house_themes.dart/slytherin_theme.dart';

class AppTheme {
  const AppTheme();

  static ThemeData buildTheme(House house) {
    final HouseTheme theme;
    switch (house.name.toLowerCase()) {
      case "gryffindor":
        theme = GryffindorTheme();
      case "ravenclaw":
        theme = RavenclawTheme();
      case "hufflepuff":
        theme = HufflepuffTheme();
      case "slytherin":
        theme = SlytherinTheme();
      default:
        theme = HouseTheme();
    }

    // TODO [LB] flesh out
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: theme.primary,
        // ···
        brightness: Brightness.light,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: theme.accent3,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: theme.textColor,
          fontSize: 40,
          fontFamily: AppFonts.eduTAS,
        ),
      ),
    );
  }
}
