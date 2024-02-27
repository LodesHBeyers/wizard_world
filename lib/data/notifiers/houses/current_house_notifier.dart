import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/trait.dart';
import 'package:wizard_world/data/entities/wizard.dart';

class CurrentHouseNotifier extends Notifier<House> {
  @override
  House build() {
    // Return a default "empty" house until a house has been selected
    return const House(
      id: "",
      name: "",
      houseColours: "",
      founder: "",
      animal: "",
      element: "",
      ghost: "",
      commonRoom: "",
      heads: <Wizard>[],
      traits: <Trait>[],
    );
  }

  void changeHouse(House house) {
    state = house;
  }
}

final NotifierProvider<CurrentHouseNotifier, House> currentHouseProvider =
    NotifierProvider<CurrentHouseNotifier, House>(
  CurrentHouseNotifier.new,
);
