import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/notifiers/houses/current_house_notifier.dart';
import 'package:wizard_world/globals/globals_keys.dart';
import 'package:wizard_world/services/routing/app_router.dart';
import 'package:wizard_world/services/routing/app_routes.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wizard World',
      navigatorKey: globalNavigatorKey,
      theme: ThemeData(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      onUnknownRoute: AppRouter.onUnknownRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
