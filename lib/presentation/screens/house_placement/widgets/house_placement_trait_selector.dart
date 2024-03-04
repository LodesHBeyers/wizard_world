import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:wizard_world/data/entities/house.dart';
import 'package:wizard_world/data/entities/trait.dart';
import 'package:wizard_world/utils/app_sizes.dart';

class HouseSelectorTraitSelector extends HookWidget {
  final String text;
  final List<MapEntry<House, Trait>> traitsPool;
  final ValueSetter<List<MapEntry<House, Trait>>> onThreeSelected;

  const HouseSelectorTraitSelector({
    super.key,
    required this.text,
    required this.traitsPool,
    required this.onThreeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<MapEntry<House, Trait>>> selections = useState(
      <MapEntry<House, Trait>>[],
    );
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.s,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSizes.l,
            AppSizes.l,
            AppSizes.l,
            AppSizes.l,
          ),
          child: Wrap(
            runSpacing: AppSizes.s,
            spacing: AppSizes.s,
            alignment: WrapAlignment.center,
            children: <Widget>[
              for (MapEntry<House, Trait> entry in traitsPool)
                GestureDetector(
                  onTap: () {
                    final List<MapEntry<House, Trait>> mutable =
                        List<MapEntry<House, Trait>>.from(selections.value);
                    if (mutable.contains(entry)) {
                      mutable.remove(entry);
                    } else {
                      mutable.add(entry);
                    }
                    if (mutable.length % 3 == 0) {
                      onThreeSelected(selections.value);
                    } else {}
                    selections.value = mutable;
                  },
                  child: AnimatedContainer(
                    duration: const Duration(
                      milliseconds: 150,
                    ),
                    decoration: BoxDecoration(
                      color: selections.value.contains(entry)
                          ? Theme.of(context).colorScheme.inversePrimary
                          : null,
                      borderRadius: BorderRadius.circular(
                        AppSizes.xs,
                      ),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.xs,
                      horizontal: AppSizes.s,
                    ),
                    child: Text(
                      entry.value.name.name,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
