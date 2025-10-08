import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/store.dart';
import '../../domain/use_cases/get_store_use_case.dart';

abstract class StoreDetailsState {}

class StoreDetailsInitial extends StoreDetailsState {}

class StoreDetailsLoading extends StoreDetailsState {}

class StoreDetailsSuccess extends StoreDetailsState {
  final Store store;

  StoreDetailsSuccess(this.store);
}

class StoreDetailsFailure extends StoreDetailsState {
  final String message;

  StoreDetailsFailure(this.message);
}

class StoreDetailsCubit extends Cubit<StoreDetailsState> {
  final GetStoreUseCase _getStoreUseCase;

  StoreDetailsCubit(this._getStoreUseCase) : super(StoreDetailsInitial());

  Future<void> getStore(String storeId) async {
    emit(StoreDetailsLoading());
    try {
      final store = await _getStoreUseCase(storeId);
      emit(StoreDetailsSuccess(store));
    } catch (e) {
      emit(StoreDetailsFailure(e.toString()));
    }
  }
}
