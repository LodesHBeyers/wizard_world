import 'package:flutter/material.dart';

class StyledAppBar extends AppBar {
  final String heading;

  StyledAppBar({
    super.key,
    required this.heading,
    super.actions,
  }) : super(
          elevation: 1,
        );

  StyledAppBar.centered({
    super.key,
    required this.heading,
  }) : super(
          centerTitle: true,
          elevation: 1,
        );

  @override
  Widget? get title => Text(
        heading,
      );

  @override
  Size get preferredSize => const Size.fromHeight(
        kToolbarHeight,
      );
}
