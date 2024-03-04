import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/house_placemenet_state/house_placement_state.dart';
import 'package:wizard_world/data/entities/trait.dart';
import 'package:wizard_world/data/notifiers/houses/houses_notifier.dart';

class HousePlacementNotifier extends AutoDisposeNotifier<HousePlacementState> {
  // 3 pools for pill selection
  @visibleForTesting
  final List<MapEntry<House, Trait>> traitsPool1 = <MapEntry<House, Trait>>[];
  @visibleForTesting
  final List<MapEntry<House, Trait>> traitsPool2 = <MapEntry<House, Trait>>[];
  @visibleForTesting
  final List<MapEntry<House, Trait>> traitsPool3 = <MapEntry<House, Trait>>[];
  // Used for logic flow and result House
  @visibleForTesting
  final List<MapEntry<House, Trait>> internalSelections =
      <MapEntry<House, Trait>>[];

  @visibleForTesting
  House get resultantHouse {
    final Map<House, int> counts = <House, int>{};
    // Tally counts
    for (MapEntry<House, Trait> selection in internalSelections) {
      int value = counts[selection.key] ?? 0;
      value++;
      counts[selection.key] = value;
    }
    int maxCount = 0;
    late House maxHouse;

    counts.forEach((House key, int value) {
      if (value > maxCount) {
        maxHouse = key;
      }
    });

    return maxHouse;
  }

  @override
  HousePlacementState build() {
    populatedPools();
    return HousePlacementState.intro(
      text:
          "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
    );
  }

  void populatedPools() {
    // This cannot be null atr this point, only entry path to placement is via a loaded houses screen
    final List<House> houses = ref.read(housesProvider).asData!.value;
    final List<MapEntry<House, Trait>> allPool = <MapEntry<House, Trait>>[];

    for (House house in houses) {
      allPool.addAll(
        house.traits.map(
          (Trait trait) => MapEntry<House, Trait>(
            house,
            trait,
          ),
        ),
      );
    }

    // Randomize pool
    allPool.shuffle();

    final int thirdCount = (allPool.length / 3).floor();

    traitsPool1.addAll(
      allPool.getRange(
        0,
        thirdCount,
      ),
    );
    traitsPool2.addAll(
      allPool.getRange(
        thirdCount,
        thirdCount * 2,
      ),
    );
    traitsPool3.addAll(
      allPool.getRange(
        thirdCount * 2,
        allPool.length,
      ),
    );
  }

  void startSelection() {
    state = HousePlacementState.selection(
      traitsPool: traitsPool1,
      text:
          "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
    );
  }

  void next(
    List<MapEntry<House, Trait>> selections,
  ) {
    // If _selections is empty, previous set was pool1, use pool 2
    final List<MapEntry<House, Trait>> traitsToUse =
        internalSelections.isEmpty ? traitsPool2 : traitsPool3;
    String text = internalSelections.isEmpty
        ? "“You might belong in Gryffindor, Where dwell the brave at heart, Their daring, nerve, and chivalry, Set Gryffindors apart”"
        : "“Or perhaps in Slytherin, You'll make your real friends, Those cunning folk use any means, To achieve their ends.”";
    internalSelections.addAll(selections);

    if (internalSelections.length > 8) {
      state = HousePlacementState.result(
        house: resultantHouse,
      );
      return;
    }

    state = HousePlacementState.selection(
      traitsPool: traitsToUse,
      text: text,
    );
  }
}

final AutoDisposeNotifierProvider<HousePlacementNotifier, HousePlacementState>
    housePlacementProvider =
    AutoDisposeNotifierProvider<HousePlacementNotifier, HousePlacementState>(
  HousePlacementNotifier.new,
);
