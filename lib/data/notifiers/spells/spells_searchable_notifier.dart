import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/data/notifiers/searchable_notifier.dart';
import 'package:wizard_world/data/repositories/spells_repository.dart';

class SpellsSearchableNotifier extends SearchableNotifier<Spell> {
  @override
  Future<List<Spell>> loadResults(String query) {
    return ref.read(spellsRepositoryProvider).getQueriedSpells(
          name: query,
        );
  }
}

final AutoDisposeAsyncNotifierProvider<SpellsSearchableNotifier, List<Spell>>
    spellsSearchProvider =
    AutoDisposeAsyncNotifierProvider<SpellsSearchableNotifier, List<Spell>>(
  SpellsSearchableNotifier.new,
);
