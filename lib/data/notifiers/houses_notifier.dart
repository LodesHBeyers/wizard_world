import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/repositories/houses_repository.dart';

class HousesNotifier extends AsyncNotifier<List<House>> {
  @override
  FutureOr<List<House>> build() {
    return loadHouses();
  }

  Future<List<House>> loadHouses() async {
    try {
      return ref.read(housesRepositoryProvider).getAllHouses();
    } catch (e, s) {
      rethrow;
    }
  }
}

final AsyncNotifierProvider<HousesNotifier, List<House>> housesProvider =
    AsyncNotifierProvider<HousesNotifier, List<House>>(
  HousesNotifier.new,
);
