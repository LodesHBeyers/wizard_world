class Ingredient {
  final String id;
  final String name;

  const Ingredient({
    required this.id,
    required this.name,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json["id"],
      name: json["name"] ?? "",
    );
  }

  String toJson() => id;
}

/*
SCHEMA
 {
    "id": String,
    "name": String?,
  }
 */
