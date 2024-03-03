import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/assets/app_icons.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class ElixirHeader extends StatelessWidget {
  final String effect;
  final String characteristics;

  const ElixirHeader({
    super.key,
    required this.effect,
    required this.characteristics,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          AppIcons.cauldron_filled,
          width: 100,
          height: 100,
        ),
        const SizedBox(
          width: AppSizes.s,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Effect:",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      letterSpacing: .5,
                    ),
              ),
              Text(
                effect,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              if (characteristics.isNotEmpty) ...[
                Text(
                  "Characteristics:",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        letterSpacing: .5,
                      ),
                ),
                Text(
                  characteristics,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
