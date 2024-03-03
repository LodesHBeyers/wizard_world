import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:widget_test_harness/widget_test_harness.dart';
import 'package:wizard_world/presentation/theme/app_theme.dart';
import 'package:wizard_world/services/routing/app_router.dart';

final Future<void> Function(WidgetTester) Function(
  Future<void> Function(
    PublicGiven<UIWidgetTestHarness>,
    PublicWhen<UIWidgetTestHarness>,
    PublicThen<UIWidgetTestHarness>,
  ),
) testHarness = HarnessSetup.setupWidgetHarness(
  UIWidgetTestHarness.new,
);

final class UIWidgetTestHarness extends WidgetTestHarness
    with DefaultHarnessMixin {
  UIWidgetTestHarness(
    super.tester,
  );
}

base mixin DefaultHarnessMixin on FlutterTestHarness {}

extension GivenExtension on Given<UIWidgetTestHarness> {
  Future<void> setupWidget(
    Widget child, {
    ThemeMode themeMode = ThemeMode.light,
    List<Override> overrides = const <Override>[],
  }) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await loadAppFonts();

    await tester.pumpWidgetBuilder(
      wrapper: (Widget child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          home: child,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
      harness.setupWidgetTree(
        child,
      ),
    );
  }
}

extension ThenExtensions on Then<UIWidgetTestHarness> {
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
}
