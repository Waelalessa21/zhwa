import '../../data/data_sources/api_client.dart';
import '../../data/models/store_model.dart';
import '../../domain/entities/store.dart';
import '../../domain/repositories/stores_repository.dart';

class StoresRepositoryImpl implements StoresRepository {
  final ApiClient _apiClient;

  StoresRepositoryImpl(this._apiClient);

  @override
  Future<List<Store>> getStores({
    int page = 1,
    int limit = 10,
    String? search,
    String? city,
    String? sector,
  }) async {
    final response = await _apiClient.getStores(
      page: page,
      limit: limit,
      search: search,
      city: city,
      sector: sector,
    );
    return response.stores.map(_mapStoreModelToEntity).toList();
  }

  @override
  Future<Store> getStore(String storeId) async {
    final storeModel = await _apiClient.getStore(storeId);
    return _mapStoreModelToEntity(storeModel);
  }

  @override
  Future<Store> createStore(Map<String, dynamic> storeData) async {
    final storeModel = await _apiClient.createStore(storeData);
    return _mapStoreModelToEntity(storeModel);
  }

  @override
  Future<Store> updateStore(String storeId, Map<String, dynamic> storeData) async {
    final storeModel = await _apiClient.updateStore(storeId, storeData);
    return _mapStoreModelToEntity(storeModel);
  }

  @override
  Future<void> deleteStore(String storeId) async {
    await _apiClient.deleteStore(storeId);
  }

  Store _mapStoreModelToEntity(StoreModel model) {
    return Store(
      name: model.name,
      sector: model.sector,
      city: model.city,
      location: model.location,
      image: model.image,
      description: model.description,
      address: model.address,
      phone: model.phone,
      email: model.email,
      products: model.products,
      id: model.id,
      ownerId: model.ownerId,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }
}
