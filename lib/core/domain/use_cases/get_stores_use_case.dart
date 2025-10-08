import '../entities/store.dart';
import '../repositories/stores_repository.dart';

class GetStoresUseCase {
  final StoresRepository _storesRepository;

  GetStoresUseCase(this._storesRepository);

  Future<List<Store>> call({
    int page = 1,
    int limit = 10,
    String? search,
    String? city,
    String? sector,
  }) {
    return _storesRepository.getStores(
      page: page,
      limit: limit,
      search: search,
      city: city,
      sector: sector,
    );
  }
}
