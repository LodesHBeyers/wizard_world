import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/entities/elixir_filter_params.dart';
import 'package:wizard_world/data/notifiers/ingredients/ingredients_notifier.dart';
import 'package:wizard_world/data/repositories/elixirs_repository.dart';
import 'package:wizard_world/services/exceptions/exception_handler.dart';

class ElixirsNotifier
    extends FamilyAsyncNotifier<List<Elixir>, ElixirFilterParams>
    with ExceptionHandler {
  @override
  FutureOr<List<Elixir>> build(ElixirFilterParams arg) {
    return loadElixirs();
  }

  Future<List<Elixir>> loadElixirs() async {
    try {
      // Wait the ingredients list to load for the filters
      // This is not mission critical, absorb the exception
      try {
        await ref.read(ingredientsProvider.notifier).future;
      } catch (e, s) {
        handleException(
          e,
          s,
          showMessage: false,
        );
      }
      if (arg.difficulty != null || arg.ingredient != null) {
        return ref.read(elixirsRepositoryProvider).getQueriedElixirs(
              ingredient: arg.ingredient?.name,
              difficulty: arg.difficulty?.name,
            );
      } else {
        return ref.read(elixirsRepositoryProvider).getAllElixirs();
      }
    } catch (e, s) {
      handleException(
        e,
        s,
      );
      rethrow;
    }
  }

  void refresh() async {
    state = const AsyncLoading<List<Elixir>>();
    state = await AsyncValue.guard(
      () => loadElixirs(),
    );
  }
}

final AsyncNotifierProviderFamily<ElixirsNotifier, List<Elixir>,
        ElixirFilterParams> elixirsProvider =
    AsyncNotifierProviderFamily<ElixirsNotifier, List<Elixir>,
        ElixirFilterParams>(
  ElixirsNotifier.new,
);
