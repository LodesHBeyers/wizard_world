import 'package:flutter/material.dart';

class AppNavigator {
  static Future<void> pushNamed(
    BuildContext context,
    String routeName, {
    Object? args,
  }) {
    return Navigator.of(context).pushNamed(
      routeName,
      arguments: args,
    );
  }

  static Future<void> replaceWithNamed(
    BuildContext context,
    String routeName, {
    Object? args,
  }) {
    return Navigator.of(context).pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  static void pop(BuildContext context) {
    return Navigator.of(context).pop();
  }

  static void openEndDrawer(BuildContext context) {
    return Scaffold.of(context).openEndDrawer();
  }
}
