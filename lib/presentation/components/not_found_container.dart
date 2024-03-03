import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/app_icon.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class NotFoundContainer extends StatelessWidget {
  final String text;
  const NotFoundContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppIcon.emptyMagnifyingGlass(),
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
      ],
    );
  }
}
