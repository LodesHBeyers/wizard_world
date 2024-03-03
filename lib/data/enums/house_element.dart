// ignore_for_file: constant_identifier_names

import 'package:wizard_world/presentation/components/app_icon.dart';

enum HouseElement {
  Air,
  Earth,
  Water,
  Fire,
  Unknown;

  static HouseElement parse(String value) {
    return values.firstWhere(
      (HouseElement element) => element.name == value,
      orElse: () => Unknown,
    );
  }

  AppIcon get icon {
    switch (this) {
      case HouseElement.Air:
        return const AppIcon.airElement();
      case HouseElement.Water:
        return const AppIcon.waterElement();
      case HouseElement.Earth:
        return const AppIcon.earthElement();
      case HouseElement.Fire:
        return const AppIcon.fireElement();
      case HouseElement.Unknown:
        throw UnimplementedError();
    }
  }
}
