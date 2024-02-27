import 'package:flutter/material.dart';
import 'package:wizard_world/presentation/screens/home/home_screen.dart';
import 'package:wizard_world/presentation/screens/landing/landing_screen.dart';
import 'package:wizard_world/presentation/screens/unkown_route.dart';
import 'package:wizard_world/services/routing/app_routes.dart';

class AppRouter {
  static MaterialPageRoute<Widget> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.landing:
        return _landing(settings);
      case AppRoutes.home:
        return _home(settings);
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

  static MaterialPageRoute<UnknownRoute> _landing(RouteSettings settings) {
    return MaterialPageRoute<UnknownRoute>(
      builder: (BuildContext context) => const LandingScreen(),
    );
  }

  static MaterialPageRoute<UnknownRoute> _home(RouteSettings settings) {
    return MaterialPageRoute<UnknownRoute>(
      builder: (BuildContext context) => const HomeScreen(),
    );
  }
}
