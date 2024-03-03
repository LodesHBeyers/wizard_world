import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/repositories/cached_repository.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class HousesRepository extends CachedRepository<House> {
  final APIClient _apiClient;
  HousesRepository(
    this._apiClient,
  );

  Future<List<House>> getAllHouses() async {
    if (cache.isNotEmpty) {
      return cache;
    }
    final List<House> allHouses = await _apiClient.fetchHouses();
    updateCache(
      allHouses,
    );
    return allHouses;
  }

  Future<House> getHouse(
    String id,
  ) async {
    if (cache.isNotEmpty && cache.any((House element) => element.id == id)) {
      return cache.firstWhere((House element) => element.id == id);
    }
    return _apiClient.fetchHouse(
      id: id,
    );
  }
}

final Provider<HousesRepository> housesRepositoryProvider =
    Provider<HousesRepository>(
  (ProviderRef<HousesRepository> ref) => HousesRepository(
    ref.read(apiClientProvider),
  ),
);
