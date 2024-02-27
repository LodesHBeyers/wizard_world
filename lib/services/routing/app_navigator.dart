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
}
