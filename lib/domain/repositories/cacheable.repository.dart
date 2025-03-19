abstract class CacheableRepository {
  Future<T> cacheFetchData<T>(
      {required String cacheKey, required Future<T> service});
}
