import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/wizard.dart';
import 'package:wizard_world/presentation/screens/elixir/elixir_screen.dart';
import 'package:wizard_world/presentation/screens/elixirs/elixirs_screen.dart';
import 'package:wizard_world/presentation/screens/home/home_screen.dart';
import 'package:wizard_world/presentation/screens/house/house_screen.dart';
import 'package:wizard_world/presentation/screens/houses/houses_screen.dart';
import 'package:wizard_world/presentation/screens/spells/spells_screen.dart';
import 'package:wizard_world/presentation/screens/unkown_route.dart';
import 'package:wizard_world/presentation/screens/wizard/wizard_screen.dart';
import 'package:wizard_world/presentation/screens/wizards/wizards_screen.dart';
import 'package:wizard_world/services/routing/app_routes.dart';

class AppRouter {
  static MaterialPageRoute<Widget> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return _home(settings);
      case AppRoutes.houses:
        return _houses(settings);
      case AppRoutes.wizards:
        return _wizards(settings);
      case AppRoutes.spells:
        return _spells(settings);
      case AppRoutes.elixirs:
        return _elixirs(settings);
      case AppRoutes.house:
        return _house(settings);
      case AppRoutes.wizard:
        return _wizard(settings);
      case AppRoutes.elixir:
        return _elixir(settings);
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

  static MaterialPageRoute<Widget> _home(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => const HomeScreen(),
      );

  static MaterialPageRoute<Widget> _houses(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => const HousesScreen(),
      );

  static MaterialPageRoute<Widget> _wizards(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => const WizardsScreen(),
      );

  static MaterialPageRoute<Widget> _elixirs(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => const ElixirsScreen(),
      );

  static MaterialPageRoute<Widget> _spells(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => const SpellsScreen(),
      );

  static MaterialPageRoute<Widget> _house(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => HouseScreen(
          house: settings.arguments as House,
        ),
      );

  static MaterialPageRoute<Widget> _wizard(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => WizardScreen(
          wizard: settings.arguments as Wizard,
        ),
      );

  static MaterialPageRoute<Widget> _elixir(RouteSettings settings) =>
      MaterialPageRoute<UnknownRoute>(
        builder: (BuildContext context) => ElixirScreen(
          elixir: settings.arguments as Elixir,
        ),
      );
}
