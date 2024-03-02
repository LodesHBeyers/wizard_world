import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';
import 'package:wizard_world/presentation/screens/home/widgets/home_navigation_card.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Home",
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
}
