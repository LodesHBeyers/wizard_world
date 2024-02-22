import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class ElixirsRepository {
  final APIClient _apiClient;
  const ElixirsRepository(
    this._apiClient,
  );

  Future<List<Elixir>> getAllElixirs(
    String? name,
    String? difficulty,
    String? ingredient,
    String? inventorFullName,
    String? manufacturer,
  ) =>
      _apiClient.fetchElixirs(
        name: name,
        difficulty: difficulty,
        ingredient: ingredient,
        inventorFullName: inventorFullName,
        manufacturer: manufacturer,
      );

  Future<Elixir> getElixir(
    String id,
  ) =>
      _apiClient.fetchElixir(
        id: id,
      );
}

final Provider<ElixirsRepository> elixirsRepositoryProvider =
    Provider<ElixirsRepository>(
  (ProviderRef<ElixirsRepository> ref) => ElixirsRepository(
    ref.read(apiClientProvider),
  ),
);
