import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/repositories/wizards_repository.dart';

final FutureProviderFamily<Wizard, String> wizardProvider =
    FutureProviderFamily<Wizard, String>(
  (FutureProviderRef<Wizard> ref, String id) async {
    return ref.read(wizardsRepositoryProvider).getWizard(
          id,
        );
  },
);
