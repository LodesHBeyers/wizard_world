import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/repositories/cached_repository.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class IngredientsRepository extends CachedRepository<Ingredient> {
  final APIClient _apiClient;

  IngredientsRepository(
    this._apiClient,
  );

  Future<List<Ingredient>> getAllIngredients() async {
    if (cache.isNotEmpty) {
      return cache;
    }

    final List<Ingredient> ingredients = await _apiClient.fetchIngredients();

    updateCache(ingredients);

    return ingredients;
  }

  Future<Ingredient> getIngredient(
    String id,
  ) async {
    if (cache.isNotEmpty &&
        cache.any((Ingredient element) => element.id == id)) {
      return cache.firstWhere((Ingredient element) => element.id == id);
    }
    return _apiClient.fetchIngredient(
      id: id,
    );
  }
}

final Provider<IngredientsRepository> ingredientsRepositoryProvider =
    Provider<IngredientsRepository>(
  (ProviderRef<IngredientsRepository> ref) => IngredientsRepository(
    ref.read(apiClientProvider),
  ),
);
