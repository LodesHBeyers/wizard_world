import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/repositories/cached_repository.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class ElixirsRepository extends CachedRepository<Elixir> {
  final APIClient _apiClient;

  ElixirsRepository(
    this._apiClient,
  );

  Future<List<Elixir>> getAllElixirs() async {
    if (cache.isNotEmpty) {
      return cache;
    }
    final List<Elixir> allElixirs = await _apiClient.fetchElixirs();

    updateCache(
      allElixirs,
    );
    return allElixirs;
  }

  Future<List<Elixir>> getQueriedElixirs({
    String? name,
    String? difficulty,
    String? ingredient,
    String? inventorFullName,
    String? manufacturer,
  }) async {
    if (cache.isNotEmpty) {
      return cache.where(
        (Elixir element) {
          bool match = false;
          if (name != null) {
            match = element.name.toLowerCase().contains(
                  name.toLowerCase().trim(),
                );
            print("${element.name.toLowerCase().contains(
                  name.toLowerCase().trim(),
                )}");
          }
          if (difficulty != null) {
            match = element.difficulty.name == difficulty;
          }
          if (ingredient != null) {
            match = element.ingredients.any(
              (Ingredient element) => element.name == ingredient,
            );
          }
          if (inventorFullName != null) {
            match = element.inventors.any(
              (Wizard element) => element.fullName == inventorFullName,
            );
          }
          if (manufacturer != null) {
            match = element.manufacturer == manufacturer;
          }
          return match;
        },
      ).toList();
    }
    return _apiClient.fetchElixirs(
      name: name,
      difficulty: difficulty,
      ingredient: ingredient,
      inventorFullName: inventorFullName,
      manufacturer: manufacturer,
    );
  }

  Future<Elixir> getElixir(
    String id,
  ) async {
    if (cache.isNotEmpty && cache.any((Elixir element) => element.id == id)) {
      return cache.firstWhere((Elixir element) => element.id == id);
    }
    return _apiClient.fetchElixir(
      id: id,
    );
  }
}

final Provider<ElixirsRepository> elixirsRepositoryProvider =
    Provider<ElixirsRepository>(
  (ProviderRef<ElixirsRepository> ref) => ElixirsRepository(
    ref.read(apiClientProvider),
  ),
);
