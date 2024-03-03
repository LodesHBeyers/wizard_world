import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/data/notifiers/spells/spell_type_filter_notiifer.dart';
import 'package:wizard_world/data/notifiers/spells/spells_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/screens/spells/widgets/spell_card.dart';
import 'package:wizard_world/presentation/screens/spells/widgets/spells_filter_button.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class SpellsScreen extends ConsumerWidget {
  const SpellsScreen({super.key});

  final String _spellsInfo =
      "J. K. Rowling defined a spell as 'The generic term for a piece of magic.'.";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Spells",
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
              AppSizes.s,
            ),
            child: Text(
              _spellsInfo,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.s,
            ),
            child: Row(
              children: <Widget>[
                Text(
                  "Filter by",
                ),
                SpellsFilterButton(),
              ],
            ),
          ),
          ref.watch(spellsProvider(ref.watch(spellTypeFilterProvider))).when(
                data: (
                  List<Spell> spells,
                ) {
                  return Expanded(
                    child: Column(
                      children: <Widget>[
                        Divider(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          height: 1,
                        ),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(
                              AppSizes.s,
                            ),
                            itemCount: spells.length,
                            itemBuilder: (_, int index) {
                              return SpellCard(
                                name: spells[index].name,
                                color: spells[index].light.color,
                                effect: spells[index].effect,
                                light: spells[index].light,
                                incantation: spells[index].incantation,
                                type: spells[index].type.localizedValue,
                              );
                            },
                            separatorBuilder: (_, __) {
                              if (5 == 5) {
                                return Divider(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                );
                              }
                              return const SizedBox(
                                height: AppSizes.xs,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (Object e, StackTrace s) => Text("Error"),
                loading: () => const Center(
                  child: AnimatedLoader(),
                ),
              ),
        ],
      ),
    );
  }
}
