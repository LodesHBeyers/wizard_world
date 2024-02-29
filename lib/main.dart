import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/notifiers/theme/theme_notifier.dart';
import 'package:wizard_world/globals/globals_keys.dart';
import 'package:wizard_world/presentation/theme/app_theme.dart';
import 'package:wizard_world/services/routing/app_router.dart';
import 'package:wizard_world/services/routing/app_routes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Wizard World',
      navigatorKey: globalNavigatorKey,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ref.watch(themeModeProvider),
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
