import 'package:wizard_world/data/entities/trait.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/enums/house_element.dart';

class House {
  final String id;
  final String name;
  final String houseColours;
  final String founder;
  final String animal;
  final HouseElement element;
  final String ghost;
  final String commonRoom;
  final List<Wizard> heads;
  final List<Trait> traits;

  const House({
    required this.id,
    required this.name,
    required this.houseColours,
    required this.founder,
    required this.animal,
    required this.element,
    required this.ghost,
    required this.commonRoom,
    required this.heads,
    required this.traits,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json["id"],
      name: json["name"],
      houseColours: json["houseColours"],
      founder: json["founder"],
      animal: json["animal"],
      element: HouseElement.parse(json["element"]),
      ghost: json["ghost"],
      commonRoom: json["commonRoom"],
      heads: <Wizard>[
        for (Map<String, dynamic> wizardJson in json["heads"])
          Wizard.fromJson(
            wizardJson,
          ),
      ],
      traits: <Trait>[
        for (Map<String, dynamic> traitJson in json["traits"])
          Trait.fromJson(
            traitJson,
          ),
      ],
    );
  }
}

/*
SCHEMA
{
  "id": String,
  "name": String?,
  "houseColours": String?,
  "founder": String?,
  "animal": String?,
  "element": String?,
  "ghost": String?,
  "commonRoom": String?,
  "heads": List?,
  "traits": List?
}
 */
