import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/repositories/wizards_repository.dart';
import 'package:wizard_world/services/exceptions/exception_handler.dart';

class WizardsNotifier extends AsyncNotifier<List<Wizard>>
    with ExceptionHandler {
  @override
  FutureOr<List<Wizard>> build() {
    return loadWizards();
  }

  Future<List<Wizard>> loadWizards() {
    try {
      return ref.read(wizardsRepositoryProvider).getAllWizards();
    } catch (e, s) {
      handleException(e, s);
      rethrow;
    }
  }

  void refresh() async {
    state = const AsyncLoading<List<Wizard>>();
    state = await AsyncValue.guard(
      () => loadWizards(),
    );
  }
}

final AsyncNotifierProvider<WizardsNotifier, List<Wizard>> wizardsProvider =
    AsyncNotifierProvider<WizardsNotifier, List<Wizard>>(
  WizardsNotifier.new,
);
