import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/notifiers/houses/current_house_notifier.dart';
import 'package:wizard_world/globals/globals_keys.dart';
import 'package:wizard_world/services/routing/app_router.dart';
import 'package:wizard_world/services/routing/app_routes.dart';
import 'package:wizard_world/theme/app_themes.dart';

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
    final House currentHouse = ref.watch(currentHouseProvider);
    return MaterialApp(
      title: 'Wizard World',
      navigatorKey: globalNavigatorKey,
      theme: AppTheme.fromHouse(
        currentHouse,
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
      initialRoute: AppRoutes.landing,
    );
  }
}
