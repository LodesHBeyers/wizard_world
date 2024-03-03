// Simple caching mechanism

// All datas in this app are arrays
abstract class CachedRepository<T> {
  final List<T> _cache = <T>[];

  void updateCache(List<T> items) {
    _cache
      ..clear()
      ..addAll(
        items,
      );
  }

  List<T> get cache => _cache; 
}
