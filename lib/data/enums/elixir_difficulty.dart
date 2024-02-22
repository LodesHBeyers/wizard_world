// ignore_for_file: constant_identifier_names

enum ElixirDifficulty {
  Unknown,
  Advanced,
  Moderate,
  Beginner,
  OrdinaryWizardingLevel,
  OneOfAKind;

  static ElixirDifficulty parse(String value) {
    return values.firstWhere(
      (ElixirDifficulty element) => element.name == value,
      orElse: () => Unknown,
    );
  }
}
