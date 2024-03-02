import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HouseHeader extends StatelessWidget {
  final String houseBadgeImagePath;
  final Wizard houseHead;
  final Wizard houseFounder;

  const HouseHeader({
    super.key,
    required this.houseBadgeImagePath,
    required this.houseHead,
    required this.houseFounder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Image.asset(
              houseBadgeImagePath,
              width: 110,
              height: 110,
            ),
            const SizedBox(
              width: AppSizes.xs,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    AppNavigator.pushNamed(
                      context,
                      AppRoutes.wizard,
                      args: houseHead,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Head: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              letterSpacing: .5,
                            ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            houseHead.fullName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: AppSizes.s,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppNavigator.pushNamed(
                      context,
                      AppRoutes.wizard,
                      args: houseFounder,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Founder: ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              letterSpacing: .5,
                            ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            houseFounder.fullName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            size: AppSizes.s,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
