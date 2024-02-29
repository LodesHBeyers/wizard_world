import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/assets/app_fonts.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HomeNavigationCard extends StatelessWidget {
  final Color _borderColor;
  final String _title;
  final String _imagePath;
  final String _routeName;

  static List<HomeNavigationCard> get cards => const <HomeNavigationCard>[
        HomeNavigationCard.houses(),
        HomeNavigationCard.wizards(),
        HomeNavigationCard.spells(),
        HomeNavigationCard.elixirs(),
      ];

  const HomeNavigationCard.houses()
      : _borderColor = Colors.blue,
        _title = "Houses",
        _imagePath = "",
        _routeName = AppRoutes.houses,
        super(
          key: const Key(""),
        );

  const HomeNavigationCard.elixirs()
      : _borderColor = Colors.orange,
        _title = "Elixirs",
        _imagePath = "",
        _routeName = AppRoutes.elixirs,
        super(
          key: const Key(""),
        );

  const HomeNavigationCard.spells()
      : _borderColor = Colors.purple,
        _title = "Spells",
        _imagePath = "",
        _routeName = AppRoutes.spells,
        super(
          key: const Key(""),
        );

  const HomeNavigationCard.wizards()
      : _borderColor = Colors.green,
        _title = "Witches & Wizards",
        _imagePath = "",
        _routeName = AppRoutes.wizards,
        super(
          key: const Key(""),
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        splashColor: _borderColor,
        onTap: () {
          AppNavigator.toNamed(
            context,
            _routeName,
          );
        },
        child: Container(
          width: AppSizes.sw(context) * .7,
          height: AppSizes.sh(context) * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSizes.s,
            ),
            border: Border.all(
              color: _borderColor,
              width: 1.5,
            ),
          ),
          padding: const EdgeInsets.all(
            AppSizes.s,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _title,
                style: TextStyle(
                  fontFamily: AppFonts.magicSchool,
                  fontSize: 44,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
