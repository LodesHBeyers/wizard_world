import 'package:flutter/material.dart';
import 'package:wizard_world/data/enums/house_element.dart';
import 'package:wizard_world/presentation/components/app_icon.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HouseQuickInfo extends StatelessWidget {
  final String houseColors;
  final List<Color> houseColorsArray;
  final String animal;
  final Widget animalIcon;
  final HouseElement element;
  final String ghost;
  final String commonRoom;

  const HouseQuickInfo({
    super.key,
    required this.houseColors,
    required this.houseColorsArray,
    required this.animal,
    required this.animalIcon,
    required this.element,
    required this.ghost,
    required this.commonRoom,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _InfoElement(
          label: "Animal:",
          value: animal,
          icon: animalIcon,
        ),
        _InfoElement(
          label: "Element:",
          value: element.name,
          icon: element.icon,
        ),
        _InfoElement(
          label: "Ghost:",
          value: ghost,
          icon: const AppIcon.ghost(),
        ),
        _InfoElement(
          label: "Common room:",
          value: commonRoom,
          icon: const AppIcon.couch(),
        ),
        const SizedBox(
          height: AppSizes.m,
        ),
        Text(
          "House colors: ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(
          height: AppSizes.xs,
        ),
        Container(
          width: AppSizes.sw(context),
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSizes.xs,
            ),
            gradient: LinearGradient(
              colors: [
                for (Color color in houseColorsArray) color.withOpacity(.8)
              ],
              stops: const <double>[
                0,
                1,
              ],
            ),
          ),
          child: Center(
            child: Text(
              houseColors,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: AppSizes.m,
        ),
      ],
    );
  }
}

class _InfoElement extends StatelessWidget {
  final String label;
  final String value;
  final Widget icon;

  const _InfoElement({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.s,
        vertical: AppSizes.xs,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: AppSizes.sw(context) * .3,
            child: Text(
              label,
            ),
          ),
          const SizedBox(
            width: AppSizes.xs,
          ),
          Row(
            children: <Widget>[
              Text(
                value,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                width: AppSizes.xs,
              ),
              SizedBox(
                width: AppSizes.m,
                height: AppSizes.m,
                child: icon,
              )
            ],
          ),
        ],
      ),
    );
  }
}
