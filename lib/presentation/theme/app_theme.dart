import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/assets/app_fonts.dart';
import 'package:wizard_world/presentation/theme/color_schemes.g.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        fontFamily: AppFonts.eduTAS,
        colorScheme: lightColorScheme,
      ).copyWith(
        appBarTheme: AppBarTheme(
          color: lightColorScheme.inversePrimary,
          titleTextStyle: TextStyle(
            fontSize: 32,
            fontFamily: AppFonts.magicSchool,
            color: lightColorScheme.inverseSurface,
          ),
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        fontFamily: AppFonts.eduTAS,
        colorScheme: darkColorScheme,
      ).copyWith(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 32,
            fontFamily: AppFonts.magicSchool,
            color: darkColorScheme.inversePrimary,
          ),
        ),
      );
}
