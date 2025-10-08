import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/store.dart';
import '../../domain/use_cases/get_stores_use_case.dart';

abstract class StoresState {}

class StoresInitial extends StoresState {}

class StoresLoading extends StoresState {}

class StoresSuccess extends StoresState {
  final List<Store> stores;

  StoresSuccess(this.stores);
}

class StoresFailure extends StoresState {
  final String message;

  StoresFailure(this.message);
}

class StoresCubit extends Cubit<StoresState> {
  final GetStoresUseCase _getStoresUseCase;

  StoresCubit(this._getStoresUseCase) : super(StoresInitial());

  Future<void> getStores({
    int page = 1,
    int limit = 10,
    String? search,
    String? city,
    String? sector,
  }) async {
    emit(StoresLoading());
    try {
      final stores = await _getStoresUseCase(
        page: page,
        limit: limit,
        search: search,
        city: city,
        sector: sector,
      );
      emit(StoresSuccess(stores));
    } catch (e) {
      emit(StoresFailure(e.toString()));
    }
  }
}
