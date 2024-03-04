import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wizard_world/presentation/screens/home/widgets/home_drawer.dart';

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
          const HomeDrawer(),
        );

        await then.goldensVerified("home_drawer");
      },
    ),
  );
}
