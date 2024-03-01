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
          titleTextStyle: const TextStyle(
            fontSize: 32,
            fontFamily: AppFonts.magicSchool,
            color: Color.fromARGB(255, 31, 31, 31),
          ),
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        fontFamily: AppFonts.eduTAS,
        colorScheme: darkColorScheme,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 32,
            fontFamily: AppFonts.magicSchool,
            color: Color.fromARGB(255, 31, 31, 31),
          ),
        ),
      );
}
