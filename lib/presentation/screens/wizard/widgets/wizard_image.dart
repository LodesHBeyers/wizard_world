import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/searched_image/searched_image.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class WizardPicture extends StatelessWidget {
  final String fullName;
  const WizardPicture({
    super.key,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.l,
      ),
      child: Center(
        child: SearchedImage.circular(
          query: fullName,
          diameter: 150,
        ),
      ),
    );
  }
}
