import 'package:e_commerce_app/features/home/data/models/product_model.dart';

class HomeRepository {
  final List<ProductModel> _allProducts = const [
    ProductModel(
      id: '1',
      name: 'Classic White Tee',
      brand: 'Essential Basics',
      price: 25.00,
      image: 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
      category: 'newIn',
      isOnSale: false,
    ),
    ProductModel(
      id: '2',
      name: 'Leather Weekend Bag',
      brand: 'Travel & Gear',
      price: 150.00,
      image: 'https://images.unsplash.com/photo-1548036328-c9fa89d128fa',
      category: 'bestSeller',
      isOnSale: false,
    ),
    ProductModel(
      id: '3',
      name: 'Minimal Sneakers',
      brand: 'Street Style',
      price: 89.00,
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      category: 'sale',
      isOnSale: true,
    ),
    ProductModel(
      id: '4',
      name: 'Wool Coat',
      brand: 'Winter Essentials',
      price: 220.00,
      image: 'https://images.unsplash.com/photo-1539533018447-63fcce2678e3',
      category: 'bestSeller',
      isOnSale: false,
    ),
  ];

  Future<List<ProductModel>> getProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    return _allProducts;
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    await Future.delayed(const Duration(milliseconds: 300));
    if (category == 'all') return _allProducts;
    return _allProducts.where((p) => p.category == category).toList();
  }
}