import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/searched_image/searched_image.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class WizardCard extends StatelessWidget {
  final String fullName;

  const WizardCard({
    super.key,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
          AppSizes.s,
        ),
        child: Row(
          children: [
            SearchedImage.circular(
              query: fullName,
              diameter: 40,
            ),
            const SizedBox(
              width: AppSizes.xs,
            ),
            Expanded(
              child: Text(
                fullName,
                style: Theme.of(context).textTheme.titleMedium,
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
