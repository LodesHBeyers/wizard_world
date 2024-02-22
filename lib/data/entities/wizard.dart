import 'package:wizard_world/data/entities/elixir.dart';

class Wizard {
  final List<Elixir> elixirs;
  final String id;
  final String firstName;
  final String lastName;

  const Wizard({
    required this.elixirs,
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory Wizard.fromJson(Map<String, dynamic> json) {
    return Wizard(
      elixirs: [
        for (Map<String, dynamic> elixirJson in json["elixirs"] ?? [])
          Elixir.fromJson(
            elixirJson,
          ),
      ],
      id: json["id"],
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
    );
  }
}

/*
SCHEMA
{
  "elixirs": List?,
  "id": String,
  "firstName": String?,
  "lastName": String?
}
 */