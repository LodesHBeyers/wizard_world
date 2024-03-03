// ignore_for_file: constant_identifier_names

enum ElixirDifficulty {
  Unknown(
    "Unknown",
  ),
  Advanced(
    "Advanced",
  ),
  Moderate(
    "Moderate",
  ),
  Beginner(
    "Beginner",
  ),
  OrdinaryWizardingLevel(
    "Ordinary wizarding level",
  ),
  OneOfAKind(
    "One of a kind",
  );

  final String localizedValue;

  const ElixirDifficulty(
    this.localizedValue,
  );

  static ElixirDifficulty parse(String value) {
    return values.firstWhere(
      (ElixirDifficulty element) => element.name == value,
      orElse: () => Unknown,
    );
  }
}
