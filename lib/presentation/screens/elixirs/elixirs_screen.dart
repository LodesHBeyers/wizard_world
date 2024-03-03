import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixir_filter_notifier.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixirs_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/error_container.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/components/not_found_container.dart';
import 'package:wizard_world/presentation/screens/elixirs/widgets/elixir_card.dart';
import 'package:wizard_world/presentation/screens/elixirs/widgets/elixirs_filter_buttons.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class ElixirsScreen extends ConsumerWidget {
  const ElixirsScreen({super.key});

  final String _elixirDefinition =
      "A magical or medicinal potion, made from combining several different ingredients";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Elixirs",
      ),
      body: Column(
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
                      children: [
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
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSizes.s,
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
                                  difficulty:
                                      elixirs[index].difficulty.localizedValue,
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
                    text: "Blimey! Something went wrong fetching the elixirs.",
                    onRetry: () {
                      ref.read(elixirsProvider(ref.watch(elixirFilterProvider)).notifier).refresh();
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
