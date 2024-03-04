import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/notifiers/houses/houses_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/error_container.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/layout/responsive_layout.dart';
import 'package:wizard_world/presentation/screens/house/house_screen.dart';
import 'package:wizard_world/presentation/screens/house_placement/house_placement_screen.dart';
import 'package:wizard_world/presentation/screens/houses/widgets/house_card.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HousesScreen extends ResponsiveLayout {
  const HousesScreen({super.key});

  final String _hogwartsHousesInfo =
      "Hogwarts School of Witchcraft and Wizardry was divided into four Houses: Gryffindor, founded by Godric Gryffindor; Hufflepuff, founded by Helga Hufflepuff; Ravenclaw, founded by Rowena Ravenclaw; and Slytherin, founded by Salazar Slytherin.";

  @override
  Widget buildMobile(BuildContext context) {
    return Consumer(
      builder: (_, WidgetRef ref, __) {
        final AsyncValue<List<House>> housesState = ref.watch(
          housesProvider,
        );

        return Scaffold(
          appBar: StyledAppBar(
            heading: "Houses",
          ),
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(
                  AppSizes.s,
                ),
                child: Text(
                  _hogwartsHousesInfo,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              housesState.when(
                data: (List<House> houses) => Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: GridView.custom(
                          padding: const EdgeInsets.all(
                            AppSizes.l,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: AppSizes.s,
                            crossAxisSpacing: AppSizes.s,
                            mainAxisExtent: 165,
                          ),
                          childrenDelegate: SliverChildListDelegate(
                            <Widget>[
                              for (House house in houses)
                                GestureDetector(
                                  key: Key(house.name),
                                  onTap: () {
                                    AppNavigator.pushNamed(
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
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: AppSizes.s,
                        ),
                        child: TextButton(
                          onPressed: () {
                            AppNavigator.pushNamed(
                              context,
                              AppRoutes.placement,
                            );
                          },
                          child: const Text(
                            "Fancy a lookin'?",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                error: (Object e, StackTrace s) => ErrorContainer(
                  text: "Blimey! Something went wrong fetches the houses.",
                  onRetry: () {
                    ref.read(housesProvider.notifier).refresh();
                  },
                ),
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
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Houses",
      ),
      body: HookBuilder(
        builder: (BuildContext context) {
          final ValueNotifier<House?> selectedHouse = useState(
            null,
          );
          final ValueNotifier<bool> showPlacementScreen = useState(
            false,
          );
          return Consumer(builder: (_, WidgetRef ref, __) {
            final AsyncValue<List<House>> housesState = ref.watch(
              housesProvider,
            );
            return Row(
              children: <Widget>[
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
                          _hogwartsHousesInfo,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      housesState.when(
                        data: (List<House> houses) => Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: GridView.custom(
                                  padding: const EdgeInsets.all(
                                    AppSizes.l,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: AppSizes.s,
                                    crossAxisSpacing: AppSizes.s,
                                    mainAxisExtent: AppSizes.sh(context) * .35,
                                  ),
                                  childrenDelegate: SliverChildListDelegate(
                                    <Widget>[
                                      for (House house in houses)
                                        GestureDetector(
                                          key: Key(house.name),
                                          onTap: () {
                                            selectedHouse.value = house;
                                          },
                                          child: HouseCard(
                                            house: house,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSizes.s,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    selectedHouse.value = null;
                                    showPlacementScreen.value = true;
                                  },
                                  child: const Text(
                                    "Fancy a lookin'?",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        error: (Object e, StackTrace s) => ErrorContainer(
                          text:
                              "Blimey! Something went wrong fetches the houses.",
                          onRetry: () {
                            ref.read(housesProvider.notifier).refresh();
                          },
                        ),
                        loading: () => const Center(
                          child: AnimatedLoader(),
                        ),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                ),
                SizedBox(
                  width: (AppSizes.sw(context) - 2) * .5,
                  height: AppSizes.sh(context),
                  child: Builder(
                    builder: (BuildContext context) {
                      if (selectedHouse.value != null) {
                        return HouseScreen(
                          house: selectedHouse.value!,
                        );
                      } else if (showPlacementScreen.value) {
                        return HousePlacementScreen(
                          onDesktopHousePlacement: (House value) {
                            showPlacementScreen.value = false;
                            selectedHouse.value = value;
                          },
                        );
                      } else {
                        return const Offstage();
                      }
                    },
                  ),
                ),
              ],
            );
          });
        },
      ),
    );
  }
}
