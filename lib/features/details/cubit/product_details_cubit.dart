import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsState());

  void changeColor(int newIndex) {
    emit(ProductDetailsState(
      selectedColorIndex: newIndex,
      selectedModelIndex: state.selectedModelIndex, 
    ));
  }

  void changeModel(int newIndex) {
    emit(ProductDetailsState(
      selectedColorIndex: state.selectedColorIndex,
      selectedModelIndex: newIndex,
    ));
  }
}