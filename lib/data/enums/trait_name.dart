// ignore_for_file: constant_identifier_names

enum TraitName {
  None,
  Courage,
  Bravery,
  Determination,
  Daring,
  Nerve,
  Chivalary,
  Hardworking,
  Patience,
  Fairness,
  Just,
  Loyalty,
  Modesty,
  Wit,
  Learning,
  Wisdom,
  Acceptance,
  Inteligence,
  Creativity,
  Resourcefulness,
  Pride,
  Cunning,
  Ambition,
  Selfpreservation;

  static TraitName parse(String value) {
    return values.firstWhere(
      (TraitName element) => element.name == value,
      orElse: () => None,
    );
  }
}
