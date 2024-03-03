// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

enum SpellLight {
  None(
    "None",
    Colors.white,
  ),
  Blue(
    "Blue",
    Colors.blue,
  ),
  IcyBlue(
    "Icy-blue",
    Color.fromARGB(255, 119, 194, 255),
  ),
  Red(
    "Red",
    Colors.red,
  ),
  Gold(
    "Gold",
    Color(0xffFFD700),
  ),
  Purple(
    "Purple",
    Colors.purple,
  ),
  Transparent(
    "Transparent",
    Colors.transparent,
  ),
  White(
    "White",
    Colors.white,
  ),
  Green(
    "Green",
    Colors.green,
  ),
  Orange(
    "Orange",
    Colors.orange,
  ),
  Yellow(
    "Yellow",
    Colors.yellow,
  ),
  BrightBlue(
    "Bright blue",
    Color.fromARGB(255, 67, 170, 255),
  ),
  Pink(
    "Pink",
    Colors.pink,
  ),
  Violet(
    "Violet",
    Color(0xff7F00FF),
  ),
  BlueishWhite(
    "Bluish white",
    Color.fromARGB(255, 212, 235, 255),
  ),
  Silver(
    "Silver",
    Color(0xffC0C0C0),
  ),
  Scarlet(
    "Scarlet",
    Color.fromARGB(255, 255, 34, 0),
  ),
  Fire(
    "Fire",
    Color.fromARGB(255, 214, 79, 0),
  ),
  FieryScarlet(
    "Fiery Scarlet",
    Color.fromARGB(255, 255, 31, 15),
  ),
  Grey(
    "Grey",
    Colors.grey,
  ),
  DarkRed(
    "Dark red",
    Color.fromARGB(255, 128, 8, 0),
  ),
  Turquoise(
    "Turquoise",
    Color(0xff40E0D0),
  ),
  PsychedelicTransparentWave(
    "Psychedelic transparent wave",
    Colors.transparent,
  ),
  BrightYellow(
    "Bright yellow",
    Colors.yellow,
  ),
  BlackSmoke(
    "Black smoke",
    Colors.black,
  );

  final String localizedValue;
  final Color color;

  const SpellLight(
    this.localizedValue,
    this.color,
  );

  static SpellLight parse(String value) {
    return values.firstWhere(
      (SpellLight element) => element.name == value,
      orElse: () => None,
    );
  }

  /// Whether or not the SpellLight color is visible
  bool get isVisible {
    return switch (this) {
      PsychedelicTransparentWave || Transparent || White || None => false,
      _ => true,
    };
  }
}
