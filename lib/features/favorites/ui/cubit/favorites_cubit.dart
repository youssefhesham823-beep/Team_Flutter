import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  final List<ProductModel> _favorites = [];

  void toggleFavorite(ProductModel product) {
    final index = _favorites.indexWhere((p) => p.id == product.id);

    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(product.copyWith(isFavorite: true));
    }

    emit(FavoritesUpdated(List.from(_favorites)));
  }

  List<ProductModel> getFavorites() => _favorites;
}
