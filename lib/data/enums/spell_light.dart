// ignore_for_file: constant_identifier_names

enum SpellLight {
  None,
  Blue,
  IcyBlue,
  Red,
  Gold,
  Purple,
  Transparent,
  White,
  Green,
  Orange,
  Yellow,
  BrightBlue,
  Pink,
  Violet,
  BlueishWhite,
  Silver,
  Scarlet,
  Fire,
  FieryScarlet,
  Grey,
  DarkRed,
  Turquoise,
  PsychedelicTransparentWave,
  BrightYellow,
  BlackSmoke;

  static SpellLight parse(String value) {
    return values.firstWhere(
      (SpellLight element) => element.name == value,
      orElse: () => None,
    );
  }
}
