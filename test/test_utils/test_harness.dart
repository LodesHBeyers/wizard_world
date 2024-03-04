import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:wizard_world/presentation/theme/app_theme.dart';
import 'package:wizard_world/services/routing/app_router.dart';
import 'package:given_when_then/given_when_then.dart';

Future<void> Function(WidgetTester) testHarness(
  WidgetTestHarnessCallback<UIWidgetTestHarness> callback,
) {
  return (WidgetTester tester) => givenWhenThenWidgetTest(
        UIWidgetTestHarness(tester),
        callback,
      );
}

final class UIWidgetTestHarness extends WidgetTestHarness {
  UIWidgetTestHarness(
    super.tester,
  );
}

extension GivenExtension on WidgetTestGiven<UIWidgetTestHarness> {
  Future<void> setupWidget(
    Widget child, {
    ThemeMode themeMode = ThemeMode.light,
    List<Override> overrides = const <Override>[],
  }) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadAppFonts();

    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: child,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      ),
    );
  }
}

extension WhenExtension on WidgetTestWhen<UIWidgetTestHarness> {
  Future<void> widgetWithKeyTapped(Key key) async {
    await tester.tap(
      find.byKey(
        key,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> widgetTapped(Type t) async {
    await tester.tap(find.byType(t));
    await tester.pumpAndSettle();
  }

  Future<void> iconTapped(IconData icon) async {
    await tester.tap(
      find.byWidgetPredicate(
        (Widget widget) => widget is Icon && widget.icon == icon,
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> pumpAndSettle() => tester.pumpAndSettle();
}

extension ThenExtensions on WidgetTestThen<UIWidgetTestHarness> {
  Future<void> goldensVerified(
    String scenario,
  ) async {
    GoldenToolkit.configuration.copyWith(
      enableRealShadows: true,
      defaultDevices: <Device>[
        Device.phone,
      ],
    );

    await multiScreenGolden(
      tester,
      "\\$scenario\\$scenario",
      autoHeight: true,
      devices: <Device>[
        const Device(
          size: Size(400, 800),
          name: "phone",
        ),
        const Device(
          size: Size(1920, 1080),
          name: "desktop",
        ),
      ],
    );
  }

  void widgetIsFound(Type t) {
    expect(find.byType(t), findsOneWidget);
  }
}
