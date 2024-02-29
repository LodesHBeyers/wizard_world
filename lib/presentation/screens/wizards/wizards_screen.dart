import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';

class WizardsScreen extends StatelessWidget {
  const WizardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Wizards",
      ),
    );
  }
}
