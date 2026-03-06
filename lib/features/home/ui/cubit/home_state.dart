import 'package:e_commerce_app/features/home/data/models/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<ProductModel> products;
  final int selectedFilter;

  HomeLoaded({
    required this.products,
    this.selectedFilter = 0,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}