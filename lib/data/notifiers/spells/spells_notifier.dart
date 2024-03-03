import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/data/enums/spell_type.dart';
import 'package:wizard_world/data/repositories/spells_repository.dart';
import 'package:wizard_world/services/exceptions/exception_handler.dart';

class SpellsNotifier extends FamilyAsyncNotifier<List<Spell>, SpellType?>
    with ExceptionHandler {
  @override
  FutureOr<List<Spell>> build(SpellType? arg) {
    return loadSpells();
  }

  Future<List<Spell>> loadSpells() {
    if (arg != null) {
      return ref.read(spellsRepositoryProvider).getQueriedSpells(
            type: arg!.name,
          );
    }
    return ref.read(spellsRepositoryProvider).getAllSpells();
  }
}

final AsyncNotifierProviderFamily<SpellsNotifier, List<Spell>, SpellType?>
    spellsProvider =
    AsyncNotifierProviderFamily<SpellsNotifier, List<Spell>, SpellType?>(
  SpellsNotifier.new,
);
