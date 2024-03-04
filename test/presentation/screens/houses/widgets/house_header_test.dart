import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/presentation/components/assets/app_images.dart';
import 'package:wizard_world/presentation/screens/house/widgets/house_header.dart';

import '../../../../test_utils/test_harness.dart';

void main() {
  testGoldens(
    "Given HouseHeader When rendered Then display correct UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HouseHeader(
            houseBadgeImagePath: AppImages.gryffindorBadge,
            houseHead: Wizard(
              elixirs: [],
              id: '',
              firstName: "SomeName",
              lastName: "SomeSurname",
            ),
            houseFounder: Wizard(
              elixirs: [],
              id: '',
              firstName: "SomeOtherName",
              lastName: "SomeOtherSurname",
            ),
          ),
        );

        await then.goldensVerified(
          "house_header",
        );
      },
    ),
  );
}
