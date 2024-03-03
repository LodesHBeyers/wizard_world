import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/app_icon.dart';
import 'package:wizard_world/presentation/components/assets/app_fonts.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HomeNavigationCard extends StatelessWidget {
  final String _title;
  final AppIcon _icon;
  final String _routeName;

  static List<HomeNavigationCard> get cards => const <HomeNavigationCard>[
        HomeNavigationCard.houses(),
        HomeNavigationCard.wizards(),
        HomeNavigationCard.spells(),
        HomeNavigationCard.elixirs(),
      ];

  const HomeNavigationCard.houses()
      : _title = "Houses",
        _icon = const AppIcon.castleFilled(),
        _routeName = AppRoutes.houses,
        super(
          key: const Key(""),
        );

  const HomeNavigationCard.elixirs()
      : _title = "Elixirs",
        _icon = const AppIcon.potionFilled(),
        _routeName = AppRoutes.elixirs,
        super(
          key: const Key(""),
        );

  const HomeNavigationCard.spells()
      : _title = "Spells",
        _icon = const AppIcon.magicWandFilled(),
        _routeName = AppRoutes.spells,
        super(
          key: const Key(""),
        );

  const HomeNavigationCard.wizards()
      : _title = "Witches & Wizards",
        _icon = const AppIcon.wizardHatFilled(),
        _routeName = AppRoutes.wizards,
        super(
          key: const Key(""),
        );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNamed(
          context,
          _routeName,
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.xs,
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned(
              top: -45,
              left: -25,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 0,
              top: 150,
              child: Container(
                width: AppSizes.l,
                height: AppSizes.l,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 180,
              child: Container(
                width: AppSizes.s,
                height: AppSizes.s,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              right: 30,
              top: 210,
              child: Container(
                width: AppSizes.xs,
                height: AppSizes.xs,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -45,
              left: -25,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                AppSizes.s,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    _title,
                    style: const TextStyle(
                      fontFamily: AppFonts.magicSchool,
                      fontSize: 44,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: _icon,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
