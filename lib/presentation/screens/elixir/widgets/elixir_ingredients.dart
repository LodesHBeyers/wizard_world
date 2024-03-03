import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_information_block.dart';

class ElixirIngredients extends ElixirInfoBlock {
  final List<Ingredient> ingredients;

  const ElixirIngredients({
    super.key,
    required this.ingredients,
  });

  @override
  String get emptyString => "Ingredients are not known";

  @override
  List<String> get infoElements => <String>[
        for (Ingredient ingredient in ingredients) ingredient.name,
      ];

  @override
  String get title => "Ingredients:";
}
