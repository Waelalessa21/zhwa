import '../entities/store.dart';
import '../repositories/stores_repository.dart';

class GetStoreUseCase {
  final StoresRepository _storesRepository;

  GetStoreUseCase(this._storesRepository);

  Future<Store> call(String storeId) {
    return _storesRepository.getStore(storeId);
  }
}
