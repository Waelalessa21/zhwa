import '../data/data_sources/api_client.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../data/repositories/stores_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/repositories/stores_repository.dart';
import '../domain/use_cases/get_store_use_case.dart';
import '../domain/use_cases/get_stores_use_case.dart';
import '../domain/use_cases/get_stores_by_category_use_case.dart';
import '../domain/use_cases/login_use_case.dart';
import '../presentation/cubits/auth_cubit.dart';
import '../presentation/cubits/store_details_cubit.dart';
import '../presentation/cubits/stores_cubit.dart';
import '../presentation/cubits/stores_by_category_cubit.dart';

class DependencyInjection {
  static late final ApiClient _apiClient;
  static late final AuthRepository _authRepository;
  static late final StoresRepository _storesRepository;
  static late final LoginUseCase _loginUseCase;
  static late final GetStoresUseCase _getStoresUseCase;
  static late final GetStoreUseCase _getStoreUseCase;
  static late final GetStoresByCategoryUseCase _getStoresByCategoryUseCase;
  static late final AuthCubit _authCubit;
  static late final StoresCubit _storesCubit;
  static late final StoreDetailsCubit _storeDetailsCubit;
  static late final StoresByCategoryCubit _storesByCategoryCubit;

  static void init() {
    _apiClient = ApiClient();
    _authRepository = AuthRepositoryImpl(_apiClient);
    _storesRepository = StoresRepositoryImpl(_apiClient);
    _loginUseCase = LoginUseCase(_authRepository);
    _getStoresUseCase = GetStoresUseCase(_storesRepository);
    _getStoreUseCase = GetStoreUseCase(_storesRepository);
    _getStoresByCategoryUseCase = GetStoresByCategoryUseCase(_storesRepository);
    _authCubit = AuthCubit(_loginUseCase);
    _storesCubit = StoresCubit(_getStoresUseCase);
    _storeDetailsCubit = StoreDetailsCubit(_getStoreUseCase);
    _storesByCategoryCubit = StoresByCategoryCubit(_getStoresByCategoryUseCase);
  }

  static ApiClient get apiClient => _apiClient;
  static AuthRepository get authRepository => _authRepository;
  static StoresRepository get storesRepository => _storesRepository;
  static LoginUseCase get loginUseCase => _loginUseCase;
  static GetStoresUseCase get getStoresUseCase => _getStoresUseCase;
  static GetStoreUseCase get getStoreUseCase => _getStoreUseCase;
  static GetStoresByCategoryUseCase get getStoresByCategoryUseCase => _getStoresByCategoryUseCase;
  static AuthCubit get authCubit => _authCubit;
  static StoresCubit get storesCubit => _storesCubit;
  static StoreDetailsCubit get storeDetailsCubit => _storeDetailsCubit;
  static StoresByCategoryCubit get storesByCategoryCubit => _storesByCategoryCubit;
}
