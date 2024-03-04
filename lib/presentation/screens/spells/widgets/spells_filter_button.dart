import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/enums/spell_type.dart';
import 'package:wizard_world/data/notifiers/spells/spell_type_filter_notiifer.dart';
import 'package:wizard_world/presentation/modals/bottom_sheet_modal.dart';

class SpellsFilterButton extends ConsumerWidget {
  const SpellsFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SpellType? filterValue = ref.watch(
      spellTypeFilterProvider,
    );

    return TextButton(
      onPressed: () {
        showModal(
          context,
          title: "Spell types",
          child: ListView(
            children: <Widget>[
              ListTile(
                onTap: () {
                  ref
                      .read(
                        spellTypeFilterProvider.notifier,
                      )
                      .update(
                        (_) => null,
                      );
                  Navigator.of(context).pop();
                },
                title: const Text(
                  "All",
                ),
                selected: filterValue == null,
                selectedTileColor: Theme.of(context).colorScheme.inversePrimary,
              ),
              for (SpellType type in SpellType.values)
                ListTile(
                  onTap: () {
                    ref
                        .read(
                          spellTypeFilterProvider.notifier,
                        )
                        .update(
                          (_) => type,
                        );
                    Navigator.of(context).pop();
                  },
                  title: Text(
                    type.name,
                  ),
                  selected: filterValue == type,
                  selectedTileColor:
                      Theme.of(context).colorScheme.inversePrimary,
                ),
            ],
          ),
        );
      },
      child: Row(
        children: <Widget>[
          Text(
            "Type: ${filterValue == null ? "All" : filterValue.localizedValue}",
          ),
          const Icon(
            Icons.arrow_drop_down,
          ),
        ],
      ),
    );
  }
}
