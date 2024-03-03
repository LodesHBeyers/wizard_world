import 'package:flutter/material.dart';

part "./assets/app_icons.dart";

class AppIcon extends StatelessWidget {
  final String path;
  final double? size;

  const AppIcon.castleFilled({
    this.size,
  })  : path = _AppIcons.castle_filled,
        super(
          key: const Key(
            "ic_castleFilled",
          ),
        );

  const AppIcon.magicWandFilled({
    this.size,
  })  : path = _AppIcons.magic_wand_filled,
        super(
          key: const Key(
            "ic_magicWandFilled",
          ),
        );

  const AppIcon.potionFilled({
    this.size,
  })  : path = _AppIcons.potion_filled,
        super(
          key: const Key(
            "ic_potionFilled",
          ),
        );

  const AppIcon.wizardHatFilled({
    this.size,
  })  : path = _AppIcons.wizard_hat_filled,
        super(
          key: const Key(
            "ic_wizardHatFilled",
          ),
        );

  const AppIcon.waterElement({
    this.size,
  })  : path = _AppIcons.water_element,
        super(
          key: const Key(
            "ic_waterElement",
          ),
        );

  const AppIcon.earthElement({
    this.size,
  })  : path = _AppIcons.earth_element,
        super(
          key: const Key(
            "ic_earthElement",
          ),
        );

  const AppIcon.fireElement({
    this.size,
  })  : path = _AppIcons.fire_element,
        super(
          key: const Key(
            "ic_fireElement",
          ),
        );

  const AppIcon.airElement({
    this.size,
  })  : path = _AppIcons.air_element,
        super(
          key: const Key(
            "ic_airElement",
          ),
        );

  const AppIcon.lion({
    this.size,
  })  : path = _AppIcons.lion,
        super(
          key: const Key(
            "ic_lion",
          ),
        );

  const AppIcon.badger({
    this.size,
  })  : path = _AppIcons.badger,
        super(
          key: const Key(
            "ic_badger",
          ),
        );

  const AppIcon.serpent({
    this.size,
  })  : path = _AppIcons.serpent,
        super(
          key: const Key(
            "ic_serpent",
          ),
        );

  const AppIcon.eagle({
    this.size,
  })  : path = _AppIcons.eagle,
        super(
          key: const Key(
            "ic_eagle",
          ),
        );

  const AppIcon.ghost({
    this.size,
  })  : path = _AppIcons.ghost,
        super(
          key: const Key(
            "ic_ghost",
          ),
        );

  const AppIcon.couch({
    this.size,
  })  : path = _AppIcons.couch,
        super(
          key: const Key(
            "ic_couch",
          ),
        );

  const AppIcon.cauldronFilled({
    this.size,
  })  : path = _AppIcons.cauldron_filled,
        super(
          key: const Key(
            "ic_cauldronFilled",
          ),
        );

  const AppIcon.emptyMagnifyingGlass({
    this.size,
  })  : path = _AppIcons.empty_magnifying_glass,
        super(
          key: const Key(
            "ic_emptyMagnifyingGlass",
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      width: size,
      height: size,
      color: Theme.of(context).iconTheme.color,
    );
  }
}
