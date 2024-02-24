import 'package:riverpod/riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/services/network/api_client.dart';
import 'package:wizard_world/services/network/app_dio.dart';

class HousesRepository {
  final APIClient _apiClient;
  HousesRepository(
    this._apiClient,
  );

  final List<House> _cache = <House>[];

  Future<List<House>> getAllHouses() async {
    if (_cache.isNotEmpty) {
      return _cache;
    }
    final List<House> allHouses = await _apiClient.fetchHouses();
    _cache.addAll(
      allHouses,
    );
    return allHouses;
  }

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
