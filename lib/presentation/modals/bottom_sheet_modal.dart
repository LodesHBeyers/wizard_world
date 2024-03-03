import 'package:flutter/material.dart';
import 'package:wizard_world/utils/app_sizes.dart';

void showModal(
  BuildContext context, {
  required String title,
  required Widget child,
}) =>
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => SizedBox(
        width: AppSizes.sw(context),
        height: AppSizes.sh(context) * .65,
        child: Column(
          children: <Widget>[
            Container(
              width: AppSizes.sw(context),
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.s,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: .35,
                      ),
                ),
              ),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
