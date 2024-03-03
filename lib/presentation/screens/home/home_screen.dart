import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/layout/responsive_layout.dart';
import 'package:wizard_world/presentation/screens/home/widgets/home_drawer.dart';
import 'package:wizard_world/presentation/screens/home/widgets/home_navigation_card.dart';
import 'package:wizard_world/services/routing/app_navigator.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HomeScreen extends ResponsiveLayout {
  const HomeScreen({super.key});

  @override
  Widget buildMobile(BuildContext context) {
    return Scaffold(
      endDrawer: const HomeDrawer(),
      appBar: StyledAppBar(
        heading: "Home",
        actions: <Widget>[
          Builder(
            builder: (BuildContext scaffoldContext) {
              return IconButton(
                onPressed: () {
                  AppNavigator.openEndDrawer(scaffoldContext);
                },
                icon: const Icon(
                  Icons.settings,
                ),
              );
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.xxl,
          ),
          child: PageView(
            controller: PageController(
              viewportFraction: .8,
            ),
            children: HomeNavigationCard.cards,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildDesktop(BuildContext context) {
    return Scaffold(
      endDrawer: const HomeDrawer(),
      appBar: StyledAppBar(
        heading: "Home",
        actions: <Widget>[
          Builder(
            builder: (BuildContext scaffoldContext) {
              return IconButton(
                onPressed: () {
                  AppNavigator.openEndDrawer(scaffoldContext);
                },
                icon: const Icon(
                  Icons.settings,
                ),
              );
            },
          )
        ],
      ),
      body: LayoutBuilder(builder: (_, BoxConstraints constraints) {
        return GridView(
          padding: const EdgeInsets.all(
            AppSizes.l,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: (constraints.maxHeight - AppSizes.l * 3) / 2,
            mainAxisSpacing: AppSizes.l,
            crossAxisSpacing: AppSizes.l,
          ),
          children: HomeNavigationCard.cards,
        );
      }),
    );
  }
}
