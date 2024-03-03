import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Generic for providing a debounced result set
abstract class SearchableNotifier<T> extends AutoDisposeAsyncNotifier<List<T>> {
  Timer t = Timer(
    Duration.zero,
    () {},
  );

  @override
  FutureOr<List<T>> build() {
    // Return a default of empty array to prevent loading UI on initial load
    return <T>[];
  }

  void onQueryChange(String value) {
    if (t.isActive) {
      t.cancel();
    }
    t = Timer(
        const Duration(
          milliseconds: 800,
        ), () {
      if (value.length > 3) {
        _setItems(value);
      }
    });
  }

  void _setItems(String value) async {
    state = AsyncLoading<List<T>>();
    state = await AsyncValue.guard(
      () => loadResults(
        value,
      ),
    );
  }

  // Callback for loading results
  Future<List<T>> loadResults(String query);
}
