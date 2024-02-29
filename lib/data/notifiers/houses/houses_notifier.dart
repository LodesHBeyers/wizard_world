import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/repositories/houses_repository.dart';
import 'package:wizard_world/services/exceptions/exception_handler.dart';

class HousesNotifier extends AsyncNotifier<List<House>> with ExceptionHandler {
  @override
  FutureOr<List<House>> build() {
    return loadHouses();
  }

  Future<List<House>> loadHouses() async {
    try {
      return ref.read(housesRepositoryProvider).getAllHouses();
    } catch (e, s) {
      handleException(e, s);
      rethrow;
    }
  }
}

final AsyncNotifierProvider<HousesNotifier, List<House>> housesProvider =
    AsyncNotifierProvider<HousesNotifier, List<House>>(
  HousesNotifier.new,
);
