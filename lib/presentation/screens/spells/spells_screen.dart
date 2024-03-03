import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/spell.dart';
import 'package:wizard_world/data/notifiers/spells/spell_type_filter_notiifer.dart';
import 'package:wizard_world/data/notifiers/spells/spells_notifier.dart';
import 'package:wizard_world/data/notifiers/spells/spells_searchable_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/layout/responsive_layout.dart';
import 'package:wizard_world/presentation/modals/searchable_modal.dart';
import 'package:wizard_world/presentation/screens/spells/widgets/spell_card.dart';
import 'package:wizard_world/presentation/screens/spells/widgets/spells_filter_button.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class SpellsScreen extends ResponsiveLayout {
  const SpellsScreen({super.key});

  final String _spellsInfo =
      "J. K. Rowling defined a spell as 'The generic term for a piece of magic.'.";

  @override
  Widget buildMobile(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return Scaffold(
          appBar: StyledAppBar(
            heading: "Spells",
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearchableModal<Spell>(
                    context,
                    hintText: "Search spells",
                    provider: spellsSearchProvider,
                    itemBuilder: (p0, Spell spell) {
                      return SpellCard(
                        name: spell.name,
                        color: spell.light.color,
                        effect: spell.effect,
                        light: spell.light,
                        incantation: spell.incantation,
                        type: spell.type.localizedValue,
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
                  _spellsInfo,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              ref
                  .watch(spellsProvider(ref.watch(spellTypeFilterProvider)))
                  .when(
                    data: (
                      List<Spell> spells,
                    ) {
                      return Expanded(
                        child: Column(
                          children: <Widget>[
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
                            Divider(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
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
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return Scaffold(
          appBar: StyledAppBar(
            heading: "Spells",
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearchableModal<Spell>(
                    context,
                    hintText: "Search spells",
                    provider: spellsSearchProvider,
                    itemBuilder: (p0, Spell spell) {
                      return SpellCard(
                        name: spell.name,
                        color: spell.light.color,
                        effect: spell.effect,
                        light: spell.light,
                        incantation: spell.incantation,
                        type: spell.type.localizedValue,
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
          body: Center(
            child: SizedBox(
              height: AppSizes.sh(context),
              width: AppSizes.sw(context) * .66,
              child: Column(
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
                  ref
                      .watch(spellsProvider(ref.watch(spellTypeFilterProvider)))
                      .when(
                        data: (
                          List<Spell> spells,
                        ) {
                          return Expanded(
                            child: Column(
                              children: <Widget>[
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
                                Divider(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
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
            ),
          ),
        );
      },
    );
  }
}
