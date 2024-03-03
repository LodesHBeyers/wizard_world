import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/notifiers/wizards/wizards_notifier.dart';
import 'package:wizard_world/data/notifiers/wizards/wizards_searchable_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/error_container.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/modals/searchable_modal.dart';
import 'package:wizard_world/presentation/screens/wizards/widgets/wizard_card.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class WizardsScreen extends ConsumerWidget {
  const WizardsScreen({
    super.key,
  });

  final String infotext =
      "The origins of wizardkind is unknown. Whether, in ancient times, some humans randomly discovered they had magic, some extraterrestrial beings or objects came with magic, or there was some sort of ritual or potion or pact, their origins remained a mystery.";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Wizards",
        actions: [
          IconButton(
            onPressed: () {
              showSearchableModal<Wizard>(
                context,
                hintText: "Search spells",
                provider: wizardsSearchProvider,
                itemBuilder: (_, Wizard wizard) {
                  return GestureDetector(
                    onTap: () {
                      AppNavigator.pop(context);
                      AppNavigator.pushNamed(
                        context,
                        AppRoutes.wizard,
                        args: wizard,
                      );
                    },
                    child: WizardCard(
                      fullName: wizard.fullName,
                    ),
                  );
                },
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              AppSizes.s,
            ),
            child: Text(
              infotext,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ref.watch(wizardsProvider).when(
                  data: (List<Wizard> wizards) {
                    final List<Wizard> randomWizards = [];

                    while (randomWizards.length < 3) {
                      final int next = Random().nextInt(wizards.length - 1);
                      randomWizards.add(
                        wizards[next],
                      );
                    }

                    for (int i = 0; i < wizards.length; i++) {}

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.s,
                          ),
                          child: Text(
                            "Honorable mentions:",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(
                              AppSizes.s,
                            ),
                            itemCount: randomWizards.length,
                            itemBuilder: (_, int index) {
                              return GestureDetector(
                                onTap: () {
                                  AppNavigator.pushNamed(
                                    context,
                                    AppRoutes.wizard,
                                    args: randomWizards[index],
                                  );
                                },
                                child: WizardCard(
                                  fullName: randomWizards[index].fullName,
                                ),
                              );
                            },
                            separatorBuilder: (_, __) => const SizedBox(
                              height: AppSizes.xs,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  error: (_, __) => ErrorContainer(
                    text: "",
                    onRetry: () {
                      ref.read(wizardsProvider.notifier).refresh();
                    },
                  ),
                  loading: () => const Center(
                    child: AnimatedLoader(),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
