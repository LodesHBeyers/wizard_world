import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/repositories/ingredients_repository.dart';
import 'package:wizard_world/services/exceptions/exception_handler.dart';

class IngredientsNotifier extends AsyncNotifier<List<Ingredient>> with ExceptionHandler {
  @override
  FutureOr<List<Ingredient>> build() {
    return loadIngredients();
  }

  Future<List<Ingredient>> loadIngredients() async {
    try {
      return ref.read(ingredientsRepositoryProvider).getAllIngredients();
    } catch (e, s) {
      handleException(e, s);
      rethrow;
    }
  }
}

final AsyncNotifierProvider<IngredientsNotifier, List<Ingredient>> ingredientsProvider =
    AsyncNotifierProvider<IngredientsNotifier, List<Ingredient>>(
  IngredientsNotifier.new,
);
