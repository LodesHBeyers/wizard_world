import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/presentation/components/assets/app_icons.dart';
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
        return const Color.fromARGB(183, 255, 17, 0);
      case "Slytherin":
        return const Color.fromARGB(162, 0, 156, 5);
      case "Hufflepuff":
        return const Color.fromARGB(188, 219, 166, 18);
      case "Ravenclaw":
        return const Color.fromARGB(216, 8, 106, 187);
      default:
        throw UnimplementedError();
    }
  }

  List<Color> get houseColorsArray {
    switch (name) {
      case "Gryffindor":
        return const <Color>[
          // Scarlet
          Color(0xffFF2400),
          // Gold
          Color(0xffFFD700),
        ];
      case "Slytherin":
        return const <Color>[
          // Green
          Color(0xff00FF00),
          // Silver
          Color(0xffC0C0C0),
        ];
      case "Hufflepuff":
        return const <Color>[
          // Yellow
          Color(0xffFFFF00),
          // Black
          Color(0xff000000),
        ];
      case "Ravenclaw":
        return const <Color>[
          // Blue
          Color(0xff0000FF),
          // Bronze
          Color(0xffCD7F32),
        ];
      default:
        throw UnimplementedError();
    }
  }

  String get animalImagePath {
    switch (name) {
      case "Gryffindor":
        return AppIcons.lion;
      case "Slytherin":
        return AppIcons.serpent;
      case "Hufflepuff":
        return AppIcons.badger;
      case "Ravenclaw":
        return AppIcons.eagle;
      default:
        throw UnimplementedError();
    }
  }
}
