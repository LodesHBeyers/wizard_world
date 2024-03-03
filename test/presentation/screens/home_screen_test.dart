import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:widget_test_harness/widget_test_harness.dart';
import 'package:wizard_world/presentation/screens/home/home_screen.dart';

import '../../test_utils/test_harness.dart';

void main() {
  testGoldens(
    "Given HomeScreen When rendered Then display correct UI",
    testHarness(
      (
        Given<UIWidgetTestHarness> given,
        When<UIWidgetTestHarness> hwhen,
        Then<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HomeScreen(),
        );

        await then.goldensVerified("home_screen");
      },
    ),
  );
}
