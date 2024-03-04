import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/data/notifiers/wizards/wizard_notifier.dart';
import 'package:wizard_world/presentation/components/assets/app_images.dart';
import 'package:wizard_world/presentation/screens/house/widgets/house_header.dart';
import 'package:wizard_world/presentation/screens/wizard/wizard_screen.dart';

import '../../../../test_utils/test_harness.dart';

void main() {
  const List<Wizard> wizards = [
    Wizard(
      elixirs: [],
      id: '',
      firstName: "SomeName",
      lastName: "SomeSurname",
    ),
    Wizard(
      elixirs: [],
      id: '',
      firstName: "SomeOtherName",
      lastName: "SomeOtherSurname",
    ),
  ];
  testGoldens(
    "Given HouseHeader When rendered Then display correct UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          HouseHeader(
            houseBadgeImagePath: AppImages.gryffindorBadge,
            houseHead: wizards.first,
            houseFounder: wizards.last,
          ),
        );

        await then.goldensVerified(
          "house_header",
        );
      },
    ),
  );

  testGoldens(
    "Given HouseHeader When house head tapped Then display WizardScreen",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          HouseHeader(
            houseBadgeImagePath: AppImages.gryffindorBadge,
            houseHead: wizards.first,
            houseFounder: wizards.last,
          ),
          overrides: [
            wizardProvider.overrideWith(
              (ref, arg) => wizards.first,
            ),
          ],
        );

        await when.textTapped(wizards.first.fullName);

        await when.pumpAndSettle();

        then.widgetIsFound(WizardScreen);
      },
    ),
  );
}
