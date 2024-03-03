import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixir_filter_notifier.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixir_notifier.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixirs_notifier.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixirs_searchable_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/error_container.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/components/not_found_container.dart';
import 'package:wizard_world/presentation/layout/responsive_layout.dart';
import 'package:wizard_world/presentation/modals/searchable_modal.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_duration.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_header.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_ingredients.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_inventors.dart';
import 'package:wizard_world/presentation/screens/elixir/widgets/elixir_side_effects.dart';
import 'package:wizard_world/presentation/screens/elixirs/widgets/elixir_card.dart';
import 'package:wizard_world/presentation/screens/elixirs/widgets/elixirs_filter_buttons.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class ElixirsScreen extends ResponsiveLayout {
  const ElixirsScreen({super.key});

  final String _elixirDefinition =
      "A magical or medicinal potion, made from combining several different ingredients";

  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Elixirs",
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearchableModal<Elixir>(
                context,
                hintText: "Search elixirs",
                provider: elixirsSearchProvider,
                itemBuilder: (_, Elixir elixir) {
                  return GestureDetector(
                    onTap: () {
                      AppNavigator.pop(context);
                      AppNavigator.pushNamed(
                        context,
                        AppRoutes.elixir,
                        args: elixir.id,
                      );
                    },
                    child: ElixirCard(
                      name: elixir.name,
                      effect: elixir.effect,
                      difficulty: elixir.difficulty.localizedValue,
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
      body: Consumer(
        builder: (_, WidgetRef ref, __) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(
                  AppSizes.s,
                ),
                child: Text(
                  _elixirDefinition,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ref
                    .watch(elixirsProvider(ref.watch(elixirFilterProvider)))
                    .when(
                      data: (List<Elixir> elixirs) {
                        if (elixirs.isEmpty) {
                          return const NotFoundContainer(
                            text: "No elixirs found, try changing the filters.",
                          );
                        }
                        return Column(
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.s,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Filter by: ",
                                  ),
                                  Expanded(
                                    child: ElixirsFilterButtons(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSizes.xs,
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
                                itemCount: elixirs.length,
                                itemBuilder: (_, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      AppNavigator.pushNamed(
                                        context,
                                        AppRoutes.elixir,
                                        args: elixirs[index].id,
                                      );
                                    },
                                    child: ElixirCard(
                                      name: elixirs[index].name,
                                      effect: elixirs[index].effect,
                                      difficulty: elixirs[index]
                                          .difficulty
                                          .localizedValue,
                                    ),
                                  );
                                },
                                separatorBuilder: (_, __) {
                                  return const SizedBox(
                                    height: AppSizes.xs,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: (Object e, StackTrace s) => ErrorContainer(
                        text:
                            "Blimey! Something went wrong fetching the elixirs.",
                        onRetry: () {
                          ref
                              .read(elixirsProvider(
                                      ref.watch(elixirFilterProvider))
                                  .notifier)
                              .refresh();
                        },
                      ),
                      loading: () => const Center(
                        child: AnimatedLoader(),
                      ),
                    ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return HookBuilder(builder: (BuildContext context) {
      final ValueNotifier<Elixir?> selectedElixir = useState(
        null,
      );
      return Scaffold(
        appBar: StyledAppBar(
          heading: "Elixirs",
          actions: <Widget>[
            IconButton(
              onPressed: () {
                showSearchableModal<Elixir>(
                  context,
                  hintText: "Search elixirs",
                  provider: elixirsSearchProvider,
                  itemBuilder: (_, Elixir elixir) {
                    return GestureDetector(
                      onTap: () {
                        AppNavigator.pop(context);
                        selectedElixir.value = elixir;
                      },
                      child: ElixirCard(
                        name: elixir.name,
                        effect: elixir.effect,
                        difficulty: elixir.difficulty.localizedValue,
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
        body: Row(
          children: <Widget>[
            SizedBox(
              width: (AppSizes.sw(context) - 2) * .5,
              height: AppSizes.sh(context),
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(
                          AppSizes.s,
                        ),
                        child: Text(
                          _elixirDefinition,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: ref
                            .watch(elixirsProvider(
                                ref.watch(elixirFilterProvider)))
                            .when(
                              data: (List<Elixir> elixirs) {
                                if (elixirs.isEmpty) {
                                  return const NotFoundContainer(
                                    text:
                                        "No elixirs found, try changing the filters.",
                                  );
                                }
                                return Column(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppSizes.s,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "Filter by: ",
                                          ),
                                          Expanded(
                                            child: ElixirsFilterButtons(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppSizes.xs,
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
                                        itemCount: elixirs.length,
                                        itemBuilder: (_, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              selectedElixir.value =
                                                  elixirs[index];
                                            },
                                            child: ElixirCard(
                                              name: elixirs[index].name,
                                              effect: elixirs[index].effect,
                                              difficulty: elixirs[index]
                                                  .difficulty
                                                  .localizedValue,
                                            ),
                                          );
                                        },
                                        separatorBuilder: (_, __) {
                                          return const SizedBox(
                                            height: AppSizes.xs,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                              error: (Object e, StackTrace s) => ErrorContainer(
                                text:
                                    "Blimey! Something went wrong fetching the elixirs.",
                                onRetry: () {
                                  ref
                                      .read(elixirsProvider(
                                              ref.watch(elixirFilterProvider))
                                          .notifier)
                                      .refresh();
                                },
                              ),
                              loading: () => const Center(
                                child: AnimatedLoader(),
                              ),
                            ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const VerticalDivider(
              width: 1,
            ),
            SizedBox(
              width: (AppSizes.sw(context) - 2) * .5,
              height: AppSizes.sh(context),
              child: selectedElixir.value != null
                  ? Consumer(builder: (_, WidgetRef ref, __) {
                      final AsyncValue<Elixir> state = ref.watch(
                        elixirProvider(selectedElixir.value!.id),
                      );

                      return state.when(
                        data: (Elixir elixir) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.s,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppSizes.l,
                                  ),
                                  child: ElixirHeader(
                                    effect: elixir.effect,
                                    characteristics: elixir.characteristics,
                                  ),
                                ),
                                Divider(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                  height: 1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppSizes.l,
                                  ),
                                  child: Text.rich(
                                    TextSpan(
                                      text:
                                          "The ${elixir.name} is considered to be ",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: elixir.difficulty.localizedValue
                                                  .startsWith(
                                                      RegExp(r'[AEIOU aeiou]'))
                                              ? "an "
                                              : "a ",
                                        ),
                                        TextSpan(
                                          text:
                                              elixir.difficulty.localizedValue,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        const TextSpan(
                                          text: " difficulty elixir.",
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Card(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      AppSizes.s,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        ElixirInventors(
                                          inventors: elixir.inventors,
                                        ),
                                        const Divider(),
                                        ElixirSideEffects(
                                          sideEffects: elixir.sideEffects,
                                        ),
                                        const Divider(),
                                        ElixirIngredients(
                                          ingredients: elixir.ingredients,
                                        ),
                                        const Divider(),
                                        ElixirDuration(
                                          duration: elixir.time,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: AppSizes.l,
                                ),
                              ],
                            ),
                          ),
                        ),
                        error: (_, __) => ErrorContainer(
                          text:
                              "Blimey! Something went wrong fetching the elixir.",
                          onRetry: () {
                            ref.invalidate(
                              elixirProvider(selectedElixir.value!.id),
                            );
                          },
                        ),
                        loading: () => const Center(
                          child: AnimatedLoader(),
                        ),
                      );
                    })
                  : const Offstage(),
            ),
          ],
        ),
      );
    });
  }
}
