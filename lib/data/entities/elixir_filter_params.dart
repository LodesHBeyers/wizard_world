import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/enums/elixir_difficulty.dart';

class ElixirFilterParams {
  final ElixirDifficulty? difficulty;
  final Ingredient? ingredient;

  const ElixirFilterParams({
    this.difficulty,
    this.ingredient,
  });

  ElixirFilterParams copyWith({
    ElixirDifficulty? newDifficulty,
    Ingredient? newIngredient,
  }) {
    return ElixirFilterParams(
      difficulty: newDifficulty ?? difficulty,
      ingredient: newIngredient ?? ingredient,
    );
  }

  ElixirFilterParams removeDifficulty() {
    return ElixirFilterParams(
      difficulty: null,
      ingredient: ingredient,
    );
  }

  ElixirFilterParams removeIngredient() {
    return ElixirFilterParams(
      difficulty: difficulty,
      ingredient: null,
    );
  }
}
