import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/repositories/houses_repository.dart';

final FutureProviderFamily<House, String> houseProvider =
    FutureProviderFamily<House, String>(
  (FutureProviderRef<House> ref, String id) {
    return ref.read(housesRepositoryProvider).getHouse(
          id,
        );
  },
);
