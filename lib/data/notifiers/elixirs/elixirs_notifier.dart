import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wizard_world/data/entities/elixir.dart';
import 'package:wizard_world/data/repositories/elixirs_repository.dart';
import 'package:wizard_world/services/exceptions/exception_handler.dart';

class ElixirsNotifier extends AsyncNotifier<List<Elixir>>
    with ExceptionHandler {
  @override
  FutureOr<List<Elixir>> build() {
    return loadElixirs();
  }

  Future<List<Elixir>> loadElixirs() async {
    return ref.read(elixirsRepositoryProvider).getAllElixirs();
  }
}

final AsyncNotifierProvider<ElixirsNotifier, List<Elixir>>
    elixirsProvider =
    AsyncNotifierProvider<ElixirsNotifier, List<Elixir>>(
  ElixirsNotifier.new,
);
