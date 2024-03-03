import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';

class WizardScreen extends StatelessWidget {
  final Wizard wizard;
  const WizardScreen({
    super.key,
    required this.wizard,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.25,
              ),
        ),
      ),
      child: Scaffold(
        appBar: StyledAppBar(
          heading: wizard.fullName,
        ),
      ),
    );
  }
}
