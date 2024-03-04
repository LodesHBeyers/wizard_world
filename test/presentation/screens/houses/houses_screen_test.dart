import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:given_when_then/given_when_then.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/notifiers/houses/house_notifier.dart';
import 'package:wizard_world/data/notifiers/houses/houses_notifier.dart';
import 'package:wizard_world/presentation/screens/house/house_screen.dart';
import 'package:wizard_world/presentation/screens/houses/houses_screen.dart';

import '../../../test_utils/data_mocks/houses_mock_data.dart';
import '../../../test_utils/manual_mocks/manual_mocks.dart';
import '../../../test_utils/test_harness.dart';

void main() {
  final List<House> houses = [
    for (Map<String, dynamic> houseJson in HousesMockData.housesJson)
      House.fromJson(
        houseJson,
      ),
  ];
  testGoldens(
    "Given HomeScreen When housesProvider emits AsyncLoading Then display loading UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HousesScreen(),
          overrides: [
            housesProvider.overrideWith(
              () => MockHousesNotifier(),
            ),
          ],
        );

        await then.goldensVerified(
          "houses_screen_loading",
          customPump: (WidgetTester t) {
            return t.pump(
              const Duration(
                seconds: 1,
              ),
            );
          },
        );
      },
    ),
  );

  testGoldens(
    "Given HomeScreen When housesProvider emits AsyncError Then display error UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HousesScreen(),
          overrides: [
            housesProvider.overrideWith(
              () => MockHousesNotifier(
                initialValue: Future.error(
                  Exception(),
                ),
              ),
            ),
          ],
        );

        await then.goldensVerified(
          "houses_screen_error",
        );
      },
    ),
  );

  testGoldens(
    "Given HomeScreen When housesProvider emits AsyncData Then display loaded UI",
    testHarness(
      (
        WidgetTestGiven<UIWidgetTestHarness> given,
        WidgetTestWhen<UIWidgetTestHarness> when,
        WidgetTestThen<UIWidgetTestHarness> then,
      ) async {
        await given.setupWidget(
          const HousesScreen(),
          overrides: [
            housesProvider.overrideWith(
              () => MockHousesNotifier(
                initialValue: houses,
              ),
            ),
          ],
        );

        await then.goldensVerified(
          "houses_screen_data",
        );
      },
    ),
  );

  group("Mobile: ", () {
    testGoldens(
      "Given HomeScreen When loaded and HouseCard tapped Then navigate to HouseScreen",
      testHarness(
        (
          WidgetTestGiven<UIWidgetTestHarness> given,
          WidgetTestWhen<UIWidgetTestHarness> when,
          WidgetTestThen<UIWidgetTestHarness> then,
        ) async {
          await given.setupWidget(
            scenario: TestScenario.mobile,
            const HousesScreen(),
            overrides: [
              housesProvider.overrideWith(
                () => MockHousesNotifier(
                  initialValue: houses,
                ),
              ),
              houseProvider.overrideWith(
                (_, __) => houses.first,
              ),
            ],
          );

          await when.widgetWithKeyTapped(
            Key(
              houses.first.name,
            ),
          );

          then.widgetIsFound(
            HouseScreen,
          );
        },
      ),
    );
  });

  group("Desktop: ", () {
    testGoldens(
      "Given HomeScreen When loaded and HouseCard tapped Then display HouseScreen UI on the right",
      testHarness(
        (
          WidgetTestGiven<UIWidgetTestHarness> given,
          WidgetTestWhen<UIWidgetTestHarness> when,
          WidgetTestThen<UIWidgetTestHarness> then,
        ) async {
          await given.setupWidget(
            scenario: TestScenario.desktop,
            const HousesScreen(),
            overrides: [
              housesProvider.overrideWith(
                () => MockHousesNotifier(
                  initialValue: houses,
                ),
              ),
              houseProvider.overrideWith(
                (_, __) => houses.first,
              ),
            ],
          );

          await when.widgetWithKeyTapped(
            Key(
              houses.first.name,
            ),
          );

          await when.pumpAndSettle();

          await then
              .goldensVerifiedForDesktop("houses_screen_house_ui_on_right");
        },
      ),
    );
  });
}
