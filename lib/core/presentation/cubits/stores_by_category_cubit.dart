import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/store.dart';
import '../../domain/use_cases/get_stores_by_category_use_case.dart';

abstract class StoresByCategoryState {}

class StoresByCategoryInitial extends StoresByCategoryState {}

class StoresByCategoryLoading extends StoresByCategoryState {}

class StoresByCategorySuccess extends StoresByCategoryState {
  final String category;
  final List<Store> stores;

  StoresByCategorySuccess(this.category, this.stores);
}

class StoresByCategoryFailure extends StoresByCategoryState {
  final String message;

  StoresByCategoryFailure(this.message);
}

class StoresByCategoryCubit extends Cubit<StoresByCategoryState> {
  final GetStoresByCategoryUseCase _getStoresByCategoryUseCase;

  StoresByCategoryCubit(this._getStoresByCategoryUseCase) : super(StoresByCategoryInitial());

  Future<void> getStoresByCategory(String category) async {
    emit(StoresByCategoryLoading());
    try {
      final stores = await _getStoresByCategoryUseCase(category);
      emit(StoresByCategorySuccess(category, stores));
    } catch (e) {
      emit(StoresByCategoryFailure(e.toString()));
    }
  }
}
