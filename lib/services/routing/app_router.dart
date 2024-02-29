import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/screens/unkown_route.dart';

class AppRouter {
  static MaterialPageRoute<Widget> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return _unkownRoute(settings);
    }
  }

  static MaterialPageRoute<Widget> onUnknownRoute(RouteSettings settings) =>
      _unkownRoute(
        settings,
      );

  static MaterialPageRoute<UnknownRoute> _unkownRoute(RouteSettings settings) {
    return MaterialPageRoute<UnknownRoute>(
      builder: (BuildContext context) => const UnknownRoute(),
    );
  }
}
