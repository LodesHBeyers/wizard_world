// ignore_for_file: constant_identifier_names

import 'package:wizard_world/presentation/components/assets/app_icons.dart';

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

  String get imagePath {
    switch (this) {
      case HouseElement.Air:
        return AppIcons.air_element;
      case HouseElement.Water:
        return AppIcons.water_element;
      case HouseElement.Earth:
        return AppIcons.earth_element;
      case HouseElement.Fire:
        return AppIcons.fire_element;
      case HouseElement.Unknown:
        throw UnimplementedError();
    }
  }
}
