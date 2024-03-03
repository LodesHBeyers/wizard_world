import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/assets/app_icons.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class ErrorContainer extends StatelessWidget {
  final String text;
  final VoidCallback onRetry;

  const ErrorContainer({
    super.key,
    required this.text,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.ghost,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: AppSizes.l,
            left: AppSizes.xxl,
            right: AppSizes.xxl,
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
          onPressed: onRetry,
          child: Text(
            "RETRY",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: .75,
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
