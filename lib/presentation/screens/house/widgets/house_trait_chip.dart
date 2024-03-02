import 'package:flutter/material.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HouseTraitChip extends StatelessWidget {
  final String name;

  const HouseTraitChip({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: const EdgeInsets.all(
        AppSizes.xxs,
      ),
      label: Text(
        name.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              letterSpacing: 1,
            ),
      ),
    );
  }
}
