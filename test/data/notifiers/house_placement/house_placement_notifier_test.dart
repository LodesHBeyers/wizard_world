import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/house_placemenet_state/house_placement_state.dart';
import 'package:wizard_world/data/entities/trait.dart';
import 'package:wizard_world/data/notifiers/house_placement/house_placement_notifier.dart';
import 'package:wizard_world/data/notifiers/houses/houses_notifier.dart';

import '../../../test_utils/data_mocks/houses_mock_data.dart';
import '../../../test_utils/manual_mocks/manual_mocks.dart';

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

void main() {
  late Listener<HousePlacementState> listener;
  late ProviderContainer container;
  final List<House> houses = <House>[
    for (Map<String, dynamic> json in HousesMockData.housesJson)
      House.fromJson(json),
  ];

  void setupTest() {
    container = ProviderContainer(
      overrides: [
        housesProvider.overrideWith(
          () => MockHousesNotifier(
            initialValue: houses,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
  }

  test(
    "Given housePlacementProvider When built initially Then emit HousePlacementState.intro",
    () {
      setupTest();
      listener = Listener<HousePlacementState>();
      container.listen(
        housePlacementProvider,
        listener,
        fireImmediately: true,
      );

      verifyInOrder(
        [
          listener(
            null,
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
          )
        ],
      );

      verifyNoMoreInteractions(listener);
    },
  );

  test(
    "Given housePlacementProvider When startSelection called Then emit HousePlacementState.selection with first traits pool",
    () {
      setupTest();
      listener = Listener<HousePlacementState>();
      container.listen(
        housePlacementProvider,
        listener,
        fireImmediately: true,
      );

      container.read(housePlacementProvider.notifier).startSelection();

      verifyInOrder(
        [
          listener(
            null,
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
          ),
          listener(
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool1,
              text:
                  "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
            ),
          ),
        ],
      );

      verifyNoMoreInteractions(listener);
    },
  );

  test(
    "Given housePlacementProvider When next called and internal selections is empty Then emit HousePlacementState.selection with second traits pool",
    () {
      setupTest();
      listener = Listener<HousePlacementState>();
      container.listen(
        housePlacementProvider,
        listener,
        fireImmediately: true,
      );

      container.read(housePlacementProvider.notifier).startSelection();

      container.read(housePlacementProvider.notifier).next([
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
      ]);

      verifyInOrder(
        [
          listener(
            null,
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
          ),
          listener(
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool1,
              text:
                  "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
            ),
          ),
          listener(
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool1,
              text:
                  "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool2,
              text:
                  "“You might belong in Gryffindor, Where dwell the brave at heart, Their daring, nerve, and chivalry, Set Gryffindors apart”",
            ),
          ),
        ],
      );

      verifyNoMoreInteractions(listener);
    },
  );

  test(
    "Given housePlacementProvider When next called and internal selections is not empty Then emit HousePlacementState.selection with third traits pool",
    () {
      setupTest();
      listener = Listener<HousePlacementState>();
      container.listen(
        housePlacementProvider,
        listener,
        fireImmediately: true,
      );

      container.read(housePlacementProvider.notifier).startSelection();

      container.read(housePlacementProvider.notifier).next([
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
      ]);

      container.read(housePlacementProvider.notifier).next([
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
        MapEntry<House, Trait>(MockHouse(), MockTrait()),
      ]);

      verifyInOrder(
        [
          listener(
            null,
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
          ),
          listener(
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool1,
              text:
                  "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
            ),
          ),
          listener(
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool1,
              text:
                  "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool2,
              text:
                  "“You might belong in Gryffindor, Where dwell the brave at heart, Their daring, nerve, and chivalry, Set Gryffindors apart”",
            ),
          ),
          listener(
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool2,
              text:
                  "“You might belong in Gryffindor, Where dwell the brave at heart, Their daring, nerve, and chivalry, Set Gryffindors apart”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool3,
              text:
                  "“Or perhaps in Slytherin, You'll make your real friends, Those cunning folk use any means, To achieve their ends.”",
            ),
          ),
        ],
      );

      verifyNoMoreInteractions(listener);
    },
  );

  test(
    "Given housePlacementProvider When next called and internal selections length is greater than 8 Then emit HousePlacementState.result House having the most Traits selected",
    () {
      setupTest();
      listener = Listener<HousePlacementState>();
      container.listen(
        housePlacementProvider,
        listener,
        fireImmediately: true,
      );

      container.read(housePlacementProvider.notifier).startSelection();

      // Selections contain majority houses[2]
      container.read(housePlacementProvider.notifier).next([
        MapEntry<House, Trait>(houses[2], MockTrait()),
        MapEntry<House, Trait>(houses[1], MockTrait()),
        MapEntry<House, Trait>(houses[2], MockTrait()),
      ]);

      container.read(housePlacementProvider.notifier).next([
        MapEntry<House, Trait>(houses.first, MockTrait()),
        MapEntry<House, Trait>(houses[2], MockTrait()),
        MapEntry<House, Trait>(houses[3], MockTrait()),
      ]);

      container.read(housePlacementProvider.notifier).next([
        MapEntry<House, Trait>(houses.first, MockTrait()),
        MapEntry<House, Trait>(houses[2], MockTrait()),
        MapEntry<House, Trait>(houses[3], MockTrait()),
      ]);

      verifyInOrder(
        [
          listener(
            null,
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
          ),
          listener(
            HousePlacementState.intro(
              text:
                  "“Hmm, difficult. Very difficult. Plenty of courage, I see. Not a bad mind either. There's talent, oh my goodness yes - and a nice thirst to prove yourself, now that's interesting…. So where shall I put you?”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool1,
              text:
                  "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
            ),
          ),
          listener(
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool1,
              text:
                  "“I see you're just and loyal, those are traits of Hufflepuff, but wait, I see something else, that seems to belong to Slytherin too”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool2,
              text:
                  "“You might belong in Gryffindor, Where dwell the brave at heart, Their daring, nerve, and chivalry, Set Gryffindors apart”",
            ),
          ),
          listener(
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool2,
              text:
                  "“You might belong in Gryffindor, Where dwell the brave at heart, Their daring, nerve, and chivalry, Set Gryffindors apart”",
            ),
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool3,
              text:
                  "“Or perhaps in Slytherin, You'll make your real friends, Those cunning folk use any means, To achieve their ends.”",
            ),
          ),
          listener(
            HousePlacementState.selection(
              traitsPool:
                  container.read(housePlacementProvider.notifier).traitsPool3,
              text:
                  "“Or perhaps in Slytherin, You'll make your real friends, Those cunning folk use any means, To achieve their ends.”",
            ),
            HousePlacementState.result(
              house: container
                  .read(housePlacementProvider.notifier)
                  .resultantHouse,
            ),
          ),
        ],
      );

      verifyNoMoreInteractions(listener);
    },
  );
}

class MockHouse extends Mock implements House {}

class MockTrait extends Mock implements Trait {}
