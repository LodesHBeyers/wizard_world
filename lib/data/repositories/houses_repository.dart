import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class HousesRepository {
  final APIClient _apiClient;
  const HousesRepository(
    this._apiClient,
  );

  Future<List<House>> getAllHouses() => _apiClient.fetchHouses();

  Future<House> getHouse(
    String id,
  ) =>
      _apiClient.fetchHouse(
        id: id,
      );
}

final Provider<HousesRepository> housesRepositoryProvider =
    Provider<HousesRepository>(
  (ProviderRef<HousesRepository> ref) => HousesRepository(
    ref.read(apiClientProvider),
  ),
);
