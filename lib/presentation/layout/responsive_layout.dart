import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

abstract class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  Widget buildMobile(BuildContext context);

  Widget buildDesktop(BuildContext context);

  @nonVirtual
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 800) {
          return buildMobile(context);
        }
        return buildDesktop(context);
      },
    );
  }
}
