import 'package:e_commerce_app/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

// هنستخدم ProductModel مع إضافة الكمية بس
class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
  
  // Getter للصورة الأولى (لو موجودة)
  String get image => product.images.isNotEmpty ? product.images.first : '';
  
  // Getter للون (مؤقت - هنستخدم brand بدل color)
  String get color => product.brand;
  
  // Getter لحالة المخزون (مؤقت - هنفترض إنه متوفر)
  String get stockStatus => 'In Stock';
  
  // Getter للون حالة المخزون
  Color get stockColor => Colors.green;
  
  // السعر الحالي (مع مراعاة الخصم)
  double get currentPrice => product.isOnSale && product.oldPrice != null 
      ? product.oldPrice! 
      : product.price;
}

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;
  CartUpdated(this.items);
}