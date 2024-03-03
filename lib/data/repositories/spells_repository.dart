import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/data/repositories/cached_repository.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class SpellsRepository extends CachedRepository<Spell> {
  final APIClient _apiClient;

  SpellsRepository(
    this._apiClient,
  );

  Future<List<Spell>> getAllSpells() async {
    if (cache.isNotEmpty) {
      return cache;
    }

    final List<Spell> spells = await _apiClient.fetchSpells();

    updateCache(spells);
    return spells;
  }

  Future<List<Spell>> getQueriedSpells({
    String? name,
    String? type,
    String? incantation,
  }) async {
    if (cache.isNotEmpty) {
      return cache.where(
        (Spell element) {
          bool match = false;
          if (name != null) {
            match = element.name.toLowerCase().contains(
                  name.toLowerCase(),
                );
          }
          if (type != null) {
            match = element.type.name == type;
          }
          if (incantation != null) {
            match = element.incantation.contains(
              incantation,
            );
          }
          return match;
        },
      ).toList();
    }
    return _apiClient.fetchSpells(
      name: name,
      type: type,
      incantation: incantation,
    );
  }

  Future<Spell> getHouse(
    String id,
  ) async {
    if (cache.isNotEmpty && cache.any((Spell element) => element.id == id)) {
      return cache.firstWhere((Spell element) => element.id == id);
    }
    return _apiClient.fetchSpell(
      id: id,
    );
  }
}

final Provider<SpellsRepository> spellsRepositoryProvider =
    Provider<SpellsRepository>(
  (ProviderRef<SpellsRepository> ref) => SpellsRepository(
    ref.read(apiClientProvider),
  ),
);
