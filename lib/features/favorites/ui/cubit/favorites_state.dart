import 'package:e_commerce_app/features/home/data/models/product_model.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesUpdated extends FavoritesState {
  final List<ProductModel> favorites;
  FavoritesUpdated(this.favorites);
}