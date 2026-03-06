// الكلاس الأب
abstract class ProductDetailsState {}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final int selectedColorIndex;
  final int selectedModelIndex;

  ProductDetailsLoaded({
    this.selectedColorIndex = 0, 
    this.selectedModelIndex = 0,
  });
}

class ProductDetailsError extends ProductDetailsState {
  final String message;
  ProductDetailsError(this.message);
}