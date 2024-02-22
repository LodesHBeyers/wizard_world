// ignore_for_file: constant_identifier_names

enum SpellType {
  None,
  Charm,
  Conjuration,
  Spell,
  Transfiguration,
  HealingSpell,
  DarkCharm,
  Jinx,
  Curse,
  MagicalTransportation,
  Hex,
  CounterSpell,
  DarkArts,
  CounterJinx,
  CounterCharm,
  Untransfiguration,
  BindingMagicalContract,
  Vanishment;

  static SpellType parse(String value) {
    return values.firstWhere(
      (SpellType element) => element.name == value,
      orElse: () => None,
    );
  }
}
