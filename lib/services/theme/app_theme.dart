import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

// TODO [LB] themes
mixin AppTheme {
  final ThemeData gryffindor = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.white,
      secondary: Colors.white,
      tertiary: Colors.white,
    ),
  );

  final ThemeData ravenclaw = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.white,
      secondary: Colors.white,
      tertiary: Colors.white,
    ),
  );

  final ThemeData hufflepuff = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.white,
      secondary: Colors.white,
      tertiary: Colors.white,
    ),
  );

  final ThemeData slytherin = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      primary: Colors.white,
      secondary: Colors.white,
      tertiary: Colors.white,
    ),
  );
}

final Provider<ThemeData> themeDataProvider = Provider<ThemeData>(
  (ProviderRef<ThemeData> ref) => ThemeData(),
);
