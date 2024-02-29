import 'dart:ui';

import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/presentation/components/assets/app_images.dart';

extension HouseStyles on House {
  String get houseBadge {
    switch (name) {
      case "Gryffindor":
        return AppImages.gryffindorBadge;
      case "Slytherin":
        return AppImages.slytherinBadge;
      case "Hufflepuff":
        return AppImages.hufflepuffBadge;
      case "Ravenclaw":
        return AppImages.ravenclawBadge;
      default:
        throw UnimplementedError();
    }
  }

  Color get houseColor {
    switch (name) {
      case "Gryffindor":
        return const Color.fromARGB(255, 180, 24, 13);
      case "Slytherin":
        return const Color.fromARGB(255, 0, 117, 4);
      case "Hufflepuff":
        return const Color.fromARGB(255, 236, 174, 3);
      case "Ravenclaw":
        return const Color.fromARGB(255, 9, 98, 170);
      default:
        throw UnimplementedError();
    }
  }
}
