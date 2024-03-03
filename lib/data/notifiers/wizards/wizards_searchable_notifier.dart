import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/notifiers/searchable_notifier.dart';
import 'package:wizard_world/data/repositories/wizards_repository.dart';

class WizardsSearchableNotifier extends SearchableNotifier<Wizard> {
  @override
  Future<List<Wizard>> loadResults(String query) {
    return ref.read(wizardsRepositoryProvider).getQueriedWizards(
          firstName: query,
          lastName: query,
        );
  }
}

final AutoDisposeAsyncNotifierProvider<WizardsSearchableNotifier, List<Wizard>>
    wizardsSearchProvider =
    AutoDisposeAsyncNotifierProvider<WizardsSearchableNotifier, List<Wizard>>(
  WizardsSearchableNotifier.new,
);
