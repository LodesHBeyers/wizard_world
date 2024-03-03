import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/notifiers/wizards/wizard_notifier.dart';
import 'package:wizard_world/data/notifiers/wizards/wizards_notifier.dart';
import 'package:wizard_world/data/notifiers/wizards/wizards_searchable_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/error_container.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/components/not_found_container.dart';
import 'package:wizard_world/presentation/layout/responsive_layout.dart';
import 'package:wizard_world/presentation/modals/searchable_modal.dart';
import 'package:wizard_world/presentation/screens/wizard/widgets/wizard_image.dart';
import 'package:wizard_world/presentation/screens/wizards/widgets/wizard_card.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class WizardsScreen extends ResponsiveLayout {
  const WizardsScreen({
    super.key,
  });

  final String infotext =
      "The origins of wizardkind is unknown. Whether, in ancient times, some humans randomly discovered they had magic, some extraterrestrial beings or objects came with magic, or there was some sort of ritual or potion or pact, their origins remained a mystery.";

  @override
  Widget buildMobile(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        return Scaffold(
          appBar: StyledAppBar(
            heading: "Wizards",
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearchableModal<Wizard>(
                    context,
                    hintText: "Search wizards",
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
                        final Set<Wizard> randomWizards = <Wizard>{};

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
                                "Hogwart's quick picks: ",
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
                                        args: randomWizards.elementAt(index),
                                      );
                                    },
                                    child: WizardCard(
                                      fullName: randomWizards
                                          .elementAt(index)
                                          .fullName,
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
      },
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return HookBuilder(
      builder: (BuildContext context) {
        final ValueNotifier<Wizard?> selectedWizard = useState(
          null,
        );
        return Scaffold(
          appBar: StyledAppBar(
            heading: "Wizards",
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearchableModal<Wizard>(
                    context,
                    hintText: "Search wizards",
                    provider: wizardsSearchProvider,
                    itemBuilder: (_, Wizard wizard) {
                      return GestureDetector(
                        onTap: () {
                          AppNavigator.pop(context);
                          selectedWizard.value = wizard;
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
          body: Row(
            children: <Widget>[
              // Left side
              SizedBox(
                width: (AppSizes.sw(context) - 2) * .5,
                height: AppSizes.sh(context),
                child: Column(
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
                    Consumer(
                      builder: (_, WidgetRef ref, __) {
                        return Expanded(
                          child: ref.watch(wizardsProvider).when(
                                data: (List<Wizard> wizards) {
                                  final Set<Wizard> randomWizards = <Wizard>{};

                                  while (randomWizards.length < 3) {
                                    final int next =
                                        Random().nextInt(wizards.length - 1);
                                    randomWizards.add(
                                      wizards[next],
                                    );
                                  }

                                  for (int i = 0; i < wizards.length; i++) {}

                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: AppSizes.s,
                                        ),
                                        child: Text(
                                          "Hogwart's quick picks: ",
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
                                                selectedWizard.value =
                                                    randomWizards
                                                        .elementAt(index);
                                              },
                                              child: WizardCard(
                                                fullName: randomWizards
                                                    .elementAt(index)
                                                    .fullName,
                                              ),
                                            );
                                          },
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(
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
                                    ref
                                        .read(wizardsProvider.notifier)
                                        .refresh();
                                  },
                                ),
                                loading: () => const Center(
                                  child: AnimatedLoader(),
                                ),
                              ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const VerticalDivider(
                width: 1,
              ),
              // Right side
              SizedBox(
                width: AppSizes.sw(context) * .5,
                height: AppSizes.sh(context),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: selectedWizard.value != null
                      ? Consumer(
                          builder: (_, WidgetRef ref, __) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                WizardPicture(
                                  fullName: selectedWizard.value!.fullName,
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.fromLTRB(
                                      AppSizes.l,
                                      AppSizes.l,
                                      AppSizes.l,
                                      0,
                                    ),
                                    padding: const EdgeInsets.all(
                                      AppSizes.s,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(
                                          AppSizes.s,
                                        ),
                                        topRight: Radius.circular(
                                          AppSizes.s,
                                        ),
                                      ),
                                    ),
                                    child: ref
                                        .watch(wizardProvider(
                                            selectedWizard.value!.id))
                                        .when(
                                          data: (Wizard embellishedWizard) =>
                                              Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: AppSizes.xxs,
                                                ),
                                                child: Text(
                                                  "Elixirs: ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                              if (selectedWizard
                                                  .value!.elixirs.isEmpty)
                                                Text(
                                                  "None as of yet.",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                ),
                                              for (Elixir elixir
                                                  in selectedWizard
                                                      .value!.elixirs)
                                                GestureDetector(
                                                  onTap: () {
                                                    AppNavigator.pushNamed(
                                                      context,
                                                      AppRoutes.elixir,
                                                      args: elixir.id,
                                                    );
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "${selectedWizard.value!.elixirs.length > 1 ? "· " : ""}${elixir.name}",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall
                                                            ?.copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                            ),
                                                      ),
                                                      const Icon(
                                                        Icons.chevron_right,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          error: (Object e, __) {
                                            if (e is DioException &&
                                                e.response?.statusCode == 404) {
                                              return NotFoundContainer(
                                                text:
                                                    "The records have been wiped! We cannot find any trace of ${selectedWizard.value!.fullName}.",
                                              );
                                            }
                                            return ErrorContainer(
                                              text: "",
                                              onRetry: () {
                                                ref.invalidate(wizardProvider(
                                                    selectedWizard.value!.id));
                                              },
                                            );
                                          },
                                          loading: () => const Center(
                                            child: AnimatedLoader(),
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      : const Offstage(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
