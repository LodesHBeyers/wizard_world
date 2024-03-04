import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wizard_world/presentation/screens/home/widgets/home_navigation_card.dart';

import '../../../../test_utils/test_harness.dart';

void main() {
  testGoldens(
    "Given HomeNavigationCard.houses When rendered Then display correct UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HomeNavigationCard.houses(),
        );

        await then.goldensVerified("home_navigation_card_houses");
      },
    ),
  );

  testGoldens(
    "Given HomeNavigationCard.wizards When rendered Then display correct UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HomeNavigationCard.wizards(),
        );

        await then.goldensVerified("home_navigation_card_wizards");
      },
    ),
  );

  testGoldens(
    "Given HomeNavigationCard.spells When rendered Then display correct UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HomeNavigationCard.spells(),
        );

        await then.goldensVerified("home_navigation_card_spells");
      },
    ),
  );

  testGoldens(
    "Given HomeNavigationCard.elixirs When rendered Then display correct UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HomeNavigationCard.elixirs(),
        );

        await then.goldensVerified("home_navigation_card_elixirs");
      },
    ),
  );
}
