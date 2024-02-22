import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class IngredientsRepository {
  final APIClient _apiClient;
  const IngredientsRepository(
    this._apiClient,
  );

  Future<List<Ingredient>> getAllIngredients({
    String? name,
  }) =>
      _apiClient.fetchIngredients(
        name: name,
      );

  Future<Ingredient> getIngredient(
    String id,
  ) =>
      _apiClient.fetchIngredient(
        id: id,
      );
}

final Provider<IngredientsRepository> ingredientsRepositoryProvider =
    Provider<IngredientsRepository>(
  (ProviderRef<IngredientsRepository> ref) => IngredientsRepository(
    ref.read(apiClientProvider),
  ),
);
