import 'package:flutter/material.dart';

class AppNavigator {
  static Future<void> toNamed(
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
}
