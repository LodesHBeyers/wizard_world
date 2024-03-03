import 'package:flutter/material.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class ElixirCard extends StatelessWidget {
  final String name;
  final String effect;
  final String difficulty;

  const ElixirCard({
    super.key,
    required this.name,
    required this.effect,
    required this.difficulty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.s,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  if (effect.isNotEmpty)
                    Text(
                      effect,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  Text.rich(
                    TextSpan(
                      text: difficulty,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .35,
                          ),
                      children: [
                        TextSpan(
                          text: " difficulty",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
