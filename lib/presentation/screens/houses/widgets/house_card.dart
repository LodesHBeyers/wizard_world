import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';
import 'package:wizard_world/utils/house_styles.dart';

class HouseCard extends StatelessWidget {
  final House house;
  const HouseCard({
    super.key,
    required this.house,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushNamed(
          context,
          AppRoutes.house,
          args: house,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: house.houseColor,
          borderRadius: BorderRadius.circular(
            AppSizes.xs,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.s,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              house.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.25,
              ),
            ),
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.symmetric(
                horizontal: AppSizes.s,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    house.houseBadge,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
