import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/trait.dart';
import 'package:wizard_world/data/notifiers/house_placement/house_placement_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/assets/app_images.dart';
import 'package:wizard_world/presentation/layout/responsive_layout.dart';
import 'package:wizard_world/presentation/screens/house_placement/widgets/house_placement_trait_selector.dart';
import 'package:wizard_world/presentation/screens/houses/widgets/house_card.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HousePlacementScreen extends ResponsiveLayout {
  final ValueSetter<House>? onDesktopHousePlacement;

  const HousePlacementScreen({
    super.key,
    this.onDesktopHousePlacement,
  });

  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Where do you belong...",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.l,
            ),
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                AppImages.sortingHat,
              ),
            ),
          ),
          Consumer(
            builder: (_, WidgetRef ref, __) {
              // Listen to changes and update a variable for the animated switcher to do
              final Widget child = ref.watch(housePlacementProvider).when(
                    intro: (String message) => Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.l,
                          ),
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            ref
                                .read(housePlacementProvider.notifier)
                                .startSelection();
                          },
                          child: const Text(
                            "Continue",
                          ),
                        ),
                      ],
                    ),
                    selection: (
                      List<MapEntry<House, Trait>> traitsPool,
                      String text,
                    ) {
                      return HouseSelectorTraitSelector(
                        text: text,
                        traitsPool: traitsPool,
                        onThreeSelected: (List<MapEntry<House, Trait>> value) {
                          ref.read(housePlacementProvider.notifier).next(
                                value,
                              );
                        },
                      );
                    },
                    result: (House house) {
                      return Column(
                        children: <Widget>[
                          Text(
                            "Hmmmmm...",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSizes.s,
                            ),
                            child: Text(
                              "${house.name}!!!",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              AppNavigator.replaceWithNamed(
                                context,
                                AppRoutes.house,
                                args: house,
                              );
                            },
                            child: HouseCard(
                              house: house,
                            ),
                          ),
                        ],
                      );
                    },
                  );
              return AnimatedSwitcher(
                duration: const Duration(
                  milliseconds: 800,
                ),
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.l,
          ),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              AppImages.sortingHat,
            ),
          ),
        ),
        LayoutBuilder(
          builder: (_, BoxConstraints constraints) {
            return SizedBox(
              width: constraints.maxWidth * .66,
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  // Listen to changes and update a variable for the animated switcher to do
                  final Widget child = ref.watch(housePlacementProvider).when(
                        intro: (String message) => Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSizes.l,
                              ),
                              child: Text(
                                message,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(housePlacementProvider.notifier)
                                    .startSelection();
                              },
                              child: const Text(
                                "Continue",
                              ),
                            ),
                          ],
                        ),
                        selection: (
                          List<MapEntry<House, Trait>> traitsPool,
                          String text,
                        ) {
                          return HouseSelectorTraitSelector(
                            text: text,
                            traitsPool: traitsPool,
                            onThreeSelected:
                                (List<MapEntry<House, Trait>> value) {
                              ref.read(housePlacementProvider.notifier).next(
                                    value,
                                  );
                            },
                          );
                        },
                        result: (House house) {
                          return Column(
                            children: <Widget>[
                              Text(
                                "Hmmmmm...",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSizes.s,
                                ),
                                child: Text(
                                  "${house.name}!!!",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  onDesktopHousePlacement?.call(house);
                                },
                                child: HouseCard(
                                  house: house,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                  return AnimatedSwitcher(
                    duration: const Duration(
                      milliseconds: 800,
                    ),
                    child: child,
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
