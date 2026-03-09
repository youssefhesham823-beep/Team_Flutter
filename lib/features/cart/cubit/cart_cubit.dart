import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_state.dart';
import 'package:e_commerce_app/features/home/data/models/product_model.dart';

class CartCubit extends Cubit<CartState> {
  List<CartItem> _items = [];

  CartCubit({List<CartItem> initialItems = const []})
      : _items = List.from(initialItems),
        super(CartUpdated(initialItems));

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity < 1 || index >= _items.length) return;
    _items[index].quantity = newQuantity;
    emit(CartUpdated(List.from(_items)));
  }

  void removeItem(int index) {
    if (index >= _items.length) return;
    _items.removeAt(index);
    emit(CartUpdated(List.from(_items)));
  }

  void addItem(ProductModel product) {
    final existingIndex = _items.indexWhere((item) => item.product.id == product.id);
    if (existingIndex != -1) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    emit(CartUpdated(List.from(_items)));
  }

  void clearCart() {
    _items.clear();
    emit(CartUpdated([]));
  }

  void applyPromoCode(String code) {
    emit(CartUpdated(List.from(_items)));
  }

  void sortByPrice({bool ascending = true}) {
    if (ascending) {
      _items.sort((a, b) => a.product.price.compareTo(b.product.price));
    } else {
      _items.sort((a, b) => b.product.price.compareTo(a.product.price));
    }
    emit(CartUpdated(List.from(_items)));
  }

  void sortByName({bool ascending = true}) {
    if (ascending) {
      _items.sort((a, b) => a.product.name.compareTo(b.product.name));
    } else {
      _items.sort((a, b) => b.product.name.compareTo(a.product.name));
    }
    emit(CartUpdated(List.from(_items)));
  }

  bool isProductInCart(String productId) {
    return _items.any((item) => item.product.id == productId);
  }

  CartItem? getItem(String productId) {
    try {
      return _items.firstWhere((item) => item.product.id == productId);
    } catch (e) {
      return null;
    }
  }

  List<CartItem> get items => List.unmodifiable(_items);

  double get subtotal => _items.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  double get tax => subtotal * 0.07;
  double get total => subtotal + tax;
  int get totalItems => _items.fold(0, (sum, item) => sum + item.quantity);
  bool get hasItems => _items.isNotEmpty;
}