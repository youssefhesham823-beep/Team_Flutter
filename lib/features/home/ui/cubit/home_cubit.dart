import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:e_commerce_app/features/home/data/repositories/home_repository.dart';
import 'package:e_commerce_app/features/home/ui/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _repository;

  HomeCubit(this._repository) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());
    try {
      final products = await _repository.getProducts();
      emit(HomeLoaded(products: products, selectedFilter: 0));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> changeFilter(int index) async {
    if (state is HomeLoaded) {
      final categories = ['all', 'newIn', 'bestSeller', 'sale'];
      final products = await _repository.getProductsByCategory(categories[index]);
      emit(HomeLoaded(products: products, selectedFilter: index));
    }
  }
}