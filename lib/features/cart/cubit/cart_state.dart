import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  String get image => product.images.isNotEmpty ? product.images.first : '';

  String get color => product.brand;

  String get stockStatus => 'In Stock';

  Color get stockColor => Colors.green;

  double get currentPrice => product.price;
}

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;
  CartUpdated(this.items);
}