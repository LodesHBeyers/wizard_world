import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/notifiers/searchable_notifier.dart';
import 'package:wizard_world/data/repositories/elixirs_repository.dart';

class ElixirsSearchableNotifier extends SearchableNotifier<Elixir> {
  @override
  Future<List<Elixir>> loadResults(String query) {
    return ref.read(elixirsRepositoryProvider).getQueriedElixirs(
          name: query,
        );
  }
}

final AutoDisposeAsyncNotifierProvider<ElixirsSearchableNotifier, List<Elixir>>
    elixirsSearchProvider =
    AutoDisposeAsyncNotifierProvider<ElixirsSearchableNotifier, List<Elixir>>(
  ElixirsSearchableNotifier.new,
);
