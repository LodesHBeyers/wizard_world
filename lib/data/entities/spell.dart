import 'package:wizard_world/data/enums/spell_light.dart';
import 'package:wizard_world/data/enums/spell_type.dart';

class Spell {
  final String id;
  final String name;
  final String incantation;
  final String effect;
  final bool canBeVerbal;
  final SpellType type;
  final SpellLight light;
  final String creator;

  const Spell({
    required this.id,
    required this.name,
    required this.incantation,
    required this.effect,
    required this.canBeVerbal,
    required this.type,
    required this.light,
    required this.creator,
  });

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      id: json["id"],
      name: json["name"],
      incantation: json["incantation"],
      effect: json["effect"],
      canBeVerbal: json["canBeVerbal"] ?? false,
      type: SpellType.parse(
        json["type"],
      ),
      light: SpellLight.parse(
        json["light"],
      ),
      creator: json["creator"],
    );
  }
}

/*
SCHEMA
{
  "id": String,
  "name": String?,
  "incantation": String?,
  "effect": String?,
  "canBeVerbal": bool?,
  "type": String?,
  "light": String?,
  "creator": String?,
}
 */