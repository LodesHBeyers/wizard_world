import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir_filter_params.dart';
import 'package:wizard_world/data/entities/ingredient.dart';
import 'package:wizard_world/data/enums/elixir_difficulty.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixir_filter_notifier.dart';
import 'package:wizard_world/data/notifiers/ingredients/ingredients_notifier.dart';
import 'package:wizard_world/presentation/modals/bottom_sheet_modal.dart';

class ElixirsFilterButtons extends ConsumerWidget {
  const ElixirsFilterButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ElixirFilterParams filterValues = ref.watch(
      elixirFilterProvider,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Flexible(
          fit: FlexFit.tight,
          child: GestureDetector(
            onTap: () {
              showModal(
                context,
                title: "Elixir difficulties",
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      onTap: () {
                        ref
                            .read(
                              elixirFilterProvider.notifier,
                            )
                            .update(
                              (ElixirFilterParams filterParams) =>
                                  filterParams.removeDifficulty(),
                            );
                        Navigator.of(context).pop();
                      },
                      title: const Text(
                        "All",
                      ),
                      selected: filterValues.difficulty == null,
                      selectedTileColor:
                          Theme.of(context).colorScheme.inversePrimary,
                    ),
                    for (ElixirDifficulty difficulty in ElixirDifficulty.values)
                      ListTile(
                        onTap: () {
                          ref
                              .read(
                                elixirFilterProvider.notifier,
                              )
                              .update(
                                (ElixirFilterParams filterParams) =>
                                    filterParams.copyWith(
                                  newDifficulty: difficulty,
                                ),
                              );
                          Navigator.of(context).pop();
                        },
                        title: Text(
                          difficulty.localizedValue,
                        ),
                        selected: filterValues.difficulty == difficulty,
                        selectedTileColor:
                            Theme.of(context).colorScheme.inversePrimary,
                      ),
                  ],
                ),
              );
            },
            child: Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    "Difficulty: ${filterValues.difficulty == null ? "All" : filterValues.difficulty!.localizedValue}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                ),
              ],
            ),
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          child: ref.watch(ingredientsProvider).when(
                data: (List<Ingredient> ingredients) {
                  return GestureDetector(
                    onTap: () {
                      showModal(
                        context,
                        title: "Elixir ingredients",
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              onTap: () {
                                ref
                                    .read(
                                      elixirFilterProvider.notifier,
                                    )
                                    .update(
                                      (ElixirFilterParams filterParams) =>
                                          filterParams.removeIngredient(),
                                    );
                                Navigator.of(context).pop();
                              },
                              title: const Text(
                                "All",
                              ),
                              selected: filterValues.ingredient == null,
                              selectedTileColor:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                            for (Ingredient ingredient in ingredients)
                              ListTile(
                                onTap: () {
                                  ref
                                      .read(
                                        elixirFilterProvider.notifier,
                                      )
                                      .update(
                                        (ElixirFilterParams filterParams) =>
                                            filterParams.copyWith(
                                          newIngredient: ingredient,
                                        ),
                                      );
                                  Navigator.of(context).pop();
                                },
                                title: Text(
                                  ingredient.name,
                                ),
                                selected: filterValues.ingredient == ingredient,
                                selectedTileColor: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                          ],
                        ),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            "Ingredient: ${filterValues.ingredient == null ? "All" : filterValues.ingredient!.name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                        ),
                      ],
                    ),
                  );
                },
                // The data is awaited in the primary notifier
                // This is not mission critical, rather provide a clean UI
                // Without this filter instead of a cluncky retry
                error: (_, __) => const Offstage(),
                loading: () => const Offstage(),
              ),
        ),
      ],
    );
  }
}
