import '../entities/store.dart';
import '../repositories/stores_repository.dart';

class GetStoresByCategoryUseCase {
  final StoresRepository _storesRepository;

  GetStoresByCategoryUseCase(this._storesRepository);

  Future<List<Store>> call(String category) {
    return _storesRepository.getStores(sector: category, limit: 10);
  }
}
