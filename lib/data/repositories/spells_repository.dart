import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class SpellsRepository {
  final APIClient _apiClient;
  const SpellsRepository(
    this._apiClient,
  );

  Future<List<Spell>> getAllSpells({
    String? name,
    String? type,
    String? incantation,
  }) =>
      _apiClient.fetchSpells(
        name: name,
        type: type,
        incantation: incantation,
      );

  Future<Spell> getSpell(
    String id,
  ) =>
      _apiClient.fetchSpell(
        id: id,
      );
}

final Provider<SpellsRepository> spellsRepositoryProvider =
    Provider<SpellsRepository>(
  (ProviderRef<SpellsRepository> ref) => SpellsRepository(
    ref.read(apiClientProvider),
  ),
);
