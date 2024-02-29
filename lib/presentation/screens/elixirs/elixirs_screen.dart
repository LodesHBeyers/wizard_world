import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/components/app_bar/styled_app_bar.dart';

class ElixirsScreen extends StatelessWidget {
  const ElixirsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StyledAppBar(
        heading: "Elixirs",
      ),
    );
  }
}
