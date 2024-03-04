import 'dart:async';

import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixirs_notifier.dart';
import 'package:wizard_world/data/notifiers/houses/houses_notifier.dart';
import 'package:wizard_world/data/notifiers/spells/spells_notifier.dart';
import 'package:mockito/mockito.dart';
import 'package:wizard_world/data/notifiers/ingredients/ingredients_notifier.dart';
import 'package:wizard_world/data/notifiers/wizards/wizards_notifier.dart';

class MockElixirsNotifier extends ElixirsNotifier with Mock {
  final FutureOr<List<Elixir>>? initialValue;

  MockElixirsNotifier({
    this.initialValue,
  });

  @override
  FutureOr<List<Elixir>> build(_) {
    // Default to never ending future, state will be AsyncLoading
    return initialValue ?? Completer<List<Elixir>>().future;
  }
}

// Mockito does not mock Riverpod's Notifiers sufficiently.
class MockHousesNotifier extends HousesNotifier with Mock {
  final FutureOr<List<House>>? initialValue;

  MockHousesNotifier({
    this.initialValue,
  });

  @override
  FutureOr<List<House>> build() {
    // Default to never ending future, state will be AsyncLoading
    return initialValue ?? Completer<List<House>>().future;
  }
}

class MockIngredientsNotifier extends IngredientsNotifier with Mock {
  final FutureOr<List<Ingredient>>? initialValue;

  MockIngredientsNotifier({
    this.initialValue,
  });

  @override
  FutureOr<List<Ingredient>> build() {
    // Default to never ending future, state will be AsyncLoading
    return initialValue ?? Completer<List<Ingredient>>().future;
  }
}

class MockSpellsNotifier extends SpellsNotifier with Mock {
  final FutureOr<List<Spell>>? initialValue;

  MockSpellsNotifier({
    this.initialValue,
  });

  @override
  FutureOr<List<Spell>> build(_) {
    // Default to never ending future, state will be AsyncLoading
    return initialValue ?? Completer<List<Spell>>().future;
  }
}

class MockWizardsNotifier extends WizardsNotifier with Mock {
  final FutureOr<List<Wizard>>? initialValue;

  MockWizardsNotifier({
    this.initialValue,
  });

  @override
  FutureOr<List<Wizard>> build() {
    // Default to never ending future, state will be AsyncLoading
    return initialValue ?? Completer<List<Wizard>>().future;
  }
}
