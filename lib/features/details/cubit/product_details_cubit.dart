import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void fetchProductDetails() async {
    emit(ProductDetailsLoading());

    try {
      await Future.delayed(const Duration(seconds: 1));

      emit(ProductDetailsLoaded());
    } catch (e) {
      emit(ProductDetailsError("error while get order details"));
    }
  }

  void changeColor(int newIndex) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;
      emit(
        ProductDetailsLoaded(
          selectedColorIndex: newIndex,
          selectedModelIndex: currentState.selectedModelIndex,
        ),
      );
    }
  }

  void changeModel(int newIndex) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;
      emit(
        ProductDetailsLoaded(
          selectedColorIndex: currentState.selectedColorIndex,
          selectedModelIndex: newIndex,
        ),
      );
    }
  }

  void changeImage(int newIndex) {
    if (state is ProductDetailsLoaded) {
      final currentState = state as ProductDetailsLoaded;

      emit(
        ProductDetailsLoaded(
          selectedColorIndex: currentState.selectedColorIndex,
          selectedModelIndex: currentState.selectedModelIndex,
          selectedImageIndex: newIndex,
        ),
      );
    }
  }

}
