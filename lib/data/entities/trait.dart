import 'package:wizard_world/data/enums/trait_name.dart';

class Trait {
  final String id;
  final TraitName name;

  const Trait({
    required this.id,
    required this.name,
  });

  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(
      id: json["id"],
      name: TraitName.parse(
        json["name"],
      ),
    );
  }
}

/*
SCHEMA
{
      "id": String
      "name": String? -> parsed Enum [ None, Courage, Bravery, Determination, Daring, Nerve, Chivalary, Hardworking, Patience, Fairness, Just, Loyalty, Modesty, Wit, Learning, Wisdom, Acceptance, Inteligence, Creativity, Resourcefulness, Pride, Cunning, Ambition, Selfpreservation]
    }
 */
