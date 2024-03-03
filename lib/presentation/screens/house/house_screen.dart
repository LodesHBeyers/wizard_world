import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/trait.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/notifiers/houses/house_notifier.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/components/loaders/animated_loader.dart';
import 'package:wizard_world/presentation/screens/house/widgets/house_header.dart';
import 'package:wizard_world/presentation/screens/house/widgets/house_quick_info.dart';
import 'package:wizard_world/presentation/screens/house/widgets/house_trait_chip.dart';
import 'package:wizard_world/utils/app_sizes.dart';
import 'package:wizard_world/utils/house_styles.dart';

class HouseScreen extends ConsumerWidget {
  final House house;
  const HouseScreen({
    super.key,
    required this.house,
  });

  Wizard get _houseHead {
    return house.heads.firstWhere(
      (Wizard element) => element.fullName != house.founder,
    );
  }

  Wizard get _houseFounder {
    return house.heads.firstWhere(
      (Wizard element) => element.fullName == house.founder,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          color: house.houseColor.withAlpha(190),
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.25,
              ),
        ),
      ),
      child: Scaffold(
        appBar: StyledAppBar(
          heading: house.name,
        ),
        body: ref.watch(houseProvider(house.id)).when(
              data: (House house) {
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(
                          AppSizes.s,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            HouseHeader(
                              houseBadgeImagePath: house.houseBadge,
                              houseHead: _houseHead,
                              houseFounder: _houseFounder,
                            ),
                            Divider(
                              color: house.houseColor,
                              height: AppSizes.xxl,
                            ),
                            HouseQuickInfo(
                              houseColors: house.houseColours,
                              houseColorsArray: house.houseColorsArray,
                              animal: house.animal,
                              animalIcon: house.animalIcon,
                              element: house.element,
                              ghost: house.ghost,
                              commonRoom: house.commonRoom,
                            ),
                            Divider(
                              color: house.houseColor,
                              height: AppSizes.s,
                            ),
                            Text(
                              "Traits:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Wrap(
                              runSpacing: AppSizes.xs,
                              spacing: AppSizes.xs,
                              alignment: WrapAlignment.center,
                              children: [
                                for (Trait trait in house.traits)
                                  HouseTraitChip(
                                    name: trait.name.name,
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (Object e, StackTrace s) => Text("ERROR"),
              loading: () => const Center(
                child: AnimatedLoader(),
              ),
            ),
      ),
    );
  }
}
