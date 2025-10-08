import '../entities/store.dart';

abstract class StoresRepository {
  Future<List<Store>> getStores({
    int page = 1,
    int limit = 10,
    String? search,
    String? city,
    String? sector,
  });
  Future<Store> getStore(String storeId);
  Future<Store> createStore(Map<String, dynamic> storeData);
  Future<Store> updateStore(String storeId, Map<String, dynamic> storeData);
  Future<void> deleteStore(String storeId);
}
