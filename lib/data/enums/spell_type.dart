// ignore_for_file: constant_identifier_names

enum SpellType {
  None("None"),
  Charm("Charm"),
  Conjuration("Conjuration"),
  Spell("Spell"),
  Transfiguration("Transfiguration"),
  HealingSpell("Healing spell"),
  DarkCharm("Dark charm"),
  Jinx("Jinx"),
  Curse("Curse"),
  MagicalTransportation("Magical transportation"),
  Hex("Hex"),
  CounterSpell("Counter spell"),
  DarkArts("Dark arts"),
  CounterJinx("Counter jinx"),
  CounterCharm("Counter charm"),
  Untransfiguration("Untransfiguration"),
  BindingMagicalContract("Binding magical contract"),
  Vanishment("Vanishment");

  final String localizedValue;
  const SpellType(
    this.localizedValue,
  );

  static SpellType parse(String value) {
    return values.firstWhere(
      (SpellType element) => element.name == value,
      orElse: () => None,
    );
  }
}
