import 'package:flutter/material.dart';
import 'package:wizard_world/globals/globals_keys.dart';

class AppSnackBar {
  final Duration duration;
  final String message;

  AppSnackBar.show({
    this.duration = const Duration(
      seconds: 3,
    ),
    required this.message,
  }) {
    _showSnack();
  }

  AppSnackBar.showPersistent({
    required this.message,
  }) : duration = const Duration(days: 1) {
    _showSnack();
  }

  void _showSnack() {
    // This should never be null
    // Just a sanity check
    if (globalNavigatorKey.currentContext != null) {
      // Clear any currently surfaced snack bars
      ScaffoldMessenger.of(globalNavigatorKey.currentContext!).clearSnackBars();
      ScaffoldMessenger.of(globalNavigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
          duration: duration,
        ),
      );
    }
  }
}
