import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/repositories/elixirs_repository.dart';

final AutoDisposeFutureProviderFamily<Elixir, String> elixirProvider =
    AutoDisposeFutureProviderFamily<Elixir, String>(
  (FutureProviderRef<Elixir> ref, String id) {
    return ref.read(elixirsRepositoryProvider).getElixir(
          id,
        );
  },
);
