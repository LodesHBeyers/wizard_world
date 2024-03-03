import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/enums/spell_type.dart';

final AutoDisposeStateProvider<SpellType?> spellTypeFilterProvider =
    AutoDisposeStateProvider<SpellType?>(
  (_) => null,
);
