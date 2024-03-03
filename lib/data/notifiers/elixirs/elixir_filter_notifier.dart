import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir_filter_params.dart';

final AutoDisposeStateProvider<ElixirFilterParams> elixirFilterProvider =
    AutoDisposeStateProvider<ElixirFilterParams>(
  (AutoDisposeStateProviderRef<ElixirFilterParams> ref) =>
      const ElixirFilterParams(),
);
