import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wizard_world/data/notifiers/elixirs/elixirs_notifier.dart';
import 'package:wizard_world/data/notifiers/houses/houses_notifier.dart';
import 'package:wizard_world/data/notifiers/spells/spells_notifier.dart';
import 'package:wizard_world/data/notifiers/wizards/wizards_notifier.dart';
import 'package:wizard_world/presentation/screens/elixirs/elixirs_screen.dart';
import 'package:wizard_world/presentation/screens/home/home_screen.dart';
import 'package:wizard_world/presentation/screens/home/widgets/home_navigation_card.dart';
import 'package:wizard_world/presentation/screens/houses/houses_screen.dart';
import 'package:wizard_world/presentation/screens/spells/spells_screen.dart';
import 'package:wizard_world/presentation/screens/wizards/wizards_screen.dart';

import '../../../test_utils/manual_mocks/manual_mocks.dart';
import '../../../test_utils/test_harness.dart';

void main() {
  testGoldens(
    "Given HomeScreen When rendered Then display correct UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HomeScreen(),
        );

        await then.goldensVerified("home_screen");
      },
    ),
  );

  testGoldens(
    "Given HomeScreen When settings icons tapped Then display settings end drawer",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HomeScreen(),
        );

        await when.iconTapped(Icons.settings);

        await then.goldensVerified("home_screen_settings_drawer");
      },
    ),
  );

  group("Navigation: ", () {
    testGoldens(
      "Given HomeScreen When houses card tapped Then navigate HousesScreen",
      testHarness(
        (
          WidgetTestGiven<UIWidgetTestHarness> given,
          WidgetTestWhen<UIWidgetTestHarness> when,
          WidgetTestThen<UIWidgetTestHarness> then,
        ) async {
          await given.setupWidget(
            const HomeScreen(),
            overrides: [
              housesProvider.overrideWith(
                () => MockHousesNotifier(
                  initialValue: [],
                ),
              ),
            ],
          );

          await when.widgetWithKeyTapped(HomeNavigationCard.houses().key!);

          await when.pumpAndSettle();

          then.widgetIsFound(HousesScreen);
        },
      ),
    );

    testGoldens(
      "Given HomeScreen When elixirs card tapped Then navigate ElixirsScreen",
      testHarness(
        (
          WidgetTestGiven<UIWidgetTestHarness> given,
          WidgetTestWhen<UIWidgetTestHarness> when,
          WidgetTestThen<UIWidgetTestHarness> then,
        ) async {
          await given.setupWidget(
            const HomeScreen(),
            overrides: [
              elixirsProvider.overrideWith(
                () => MockElixirsNotifier(
                  initialValue: [],
                ),
              ),
            ],
          );

          await when.widgetWithKeyTapped(HomeNavigationCard.elixirs().key!);

          await when.pumpAndSettle();

          then.widgetIsFound(ElixirsScreen);
        },
      ),
    );

    testGoldens(
      "Given HomeScreen When spells card tapped Then navigate SpellsScreen",
      testHarness(
        (
          WidgetTestGiven<UIWidgetTestHarness> given,
          WidgetTestWhen<UIWidgetTestHarness> when,
          WidgetTestThen<UIWidgetTestHarness> then,
        ) async {
          await given.setupWidget(
            const HomeScreen(),
            overrides: [
              spellsProvider.overrideWith(
                () => MockSpellsNotifier(
                  initialValue: [],
                ),
              ),
            ],
          );

          await when.widgetWithKeyTapped(HomeNavigationCard.spells().key!);

          await when.pumpAndSettle();

          then.widgetIsFound(SpellsScreen);
        },
      ),
    );

    testGoldens(
      "Given HomeScreen When wizards card tapped Then navigate WizardsScreen",
      testHarness(
        (
          WidgetTestGiven<UIWidgetTestHarness> given,
          WidgetTestWhen<UIWidgetTestHarness> when,
          WidgetTestThen<UIWidgetTestHarness> then,
        ) async {
          await given.setupWidget(
            const HomeScreen(),
            overrides: [
              wizardsProvider.overrideWith(
                () => MockWizardsNotifier(
                  initialValue: [],
                ),
              ),
            ],
          );

          await when.widgetWithKeyTapped(HomeNavigationCard.wizards().key!);

          await when.pumpAndSettle();

          then.widgetIsFound(WizardsScreen);
        },
      ),
    );
  });
}
