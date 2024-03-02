import 'package:flutter/material.dart';
import 'package:wizard_world/globals/globals_keys.dart';
import 'package:wizard_world/utils/app_sizes.dart';

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
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSizes.xs,
            ),
          ),
          content: Text(
            message,
            style: Theme.of(globalNavigatorKey.currentContext!)
                .textTheme
                .labelLarge
                ?.copyWith(
                  color: Colors.white,
                ),
          ),
          duration: duration,
        ),
      );
    }
  }
}
