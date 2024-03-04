import 'package:wizard_world/data/enums/elixir_difficulty.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/entities/wizard.dart';

class Elixir {
  final String id;
  final String name;
  final String effect;
  final String sideEffects;
  final String characteristics;
  final String time;
  final ElixirDifficulty difficulty;
  final List<Ingredient> ingredients;
  final List<Wizard> inventors;
  final String manufacturer;

  const Elixir({
    required this.id,
    required this.name,
    required this.effect,
    required this.sideEffects,
    required this.characteristics,
    required this.time,
    required this.difficulty,
    required this.ingredients,
    required this.inventors,
    required this.manufacturer,
  });

  factory Elixir.fromJson(Map<String, dynamic> json) {
    return Elixir(
      id: json["id"],
      name: json["name"] ?? "",
      effect: json["effect"] ?? "",
      sideEffects: json["sideEffects"] ?? "",
      characteristics: json["characteristics"] ?? "",
      time: json["time"] ?? "",
      difficulty: ElixirDifficulty.parse(json["difficulty"] ?? ""),
      ingredients: <Ingredient>[
        for (Map<String, dynamic> ingredientJson in json["ingredients"] ?? <Map<String, dynamic>>[])
          Ingredient.fromJson(
            ingredientJson,
          ),
      ],
      inventors: <Wizard>[
        for (Map<String, dynamic> inventorJson in json["inventors"] ?? <Map<String, dynamic>>[])
          Wizard.fromJson(inventorJson),
      ],
      manufacturer: json["manufacturer"] ?? "",
    );
  }
}

/*
SCHEMA
{
  "id": String,
  "name": String?,
  "effect": String?,
  "sideEffects": String?,
  "characteristics": String?,
  "time": String?,
  "difficulty": String? -> parsed Enum [ Unknown, Advanced, Moderate, Beginner, OrdinaryWizardingLevel, OneOfAKind]
  "ingredients": List?,,
  "inventors": List?,
  "manufacturer": String?
}
 */
