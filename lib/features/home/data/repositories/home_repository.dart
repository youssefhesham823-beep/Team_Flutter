import 'package:e_commerce_app/features/home/data/models/product_model.dart';

class HomeRepository {
  final List<ProductModel> _allProducts = const [
    ProductModel(
      id: '1',
      name: 'Classic White Tee',
      brand: 'Essential Basics',
      price: 25.00,
      oldPrice: 35.00,
      rating: 4.2,
      reviewsCount: 89,
      images: [
        'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
        'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a',
        'https://images.unsplash.com/photo-1503341504253-dff4815485f1',
      ],
      description: 'A timeless classic white tee made from 100% organic cotton. Perfect for everyday wear with a relaxed fit and premium quality fabric that gets softer with every wash.',
      category: 'newIn',
      isOnSale: false,
    ),
    ProductModel(
      id: '2',
      name: 'Leather Weekend Bag',
      brand: 'Travel & Gear',
      price: 150.00,
      oldPrice: 200.00,
      rating: 4.7,
      reviewsCount: 234,
      images: [
        'https://images.unsplash.com/photo-1548036328-c9fa89d128fa',
        'https://images.unsplash.com/photo-1553062407-98eeb64c6a62',
        'https://images.unsplash.com/photo-1590874103328-eac38a683ce7',
      ],
      description: 'Handcrafted full-grain leather weekend bag with spacious main compartment, multiple pockets, and durable brass hardware. Perfect for short trips and weekend getaways.',
      category: 'bestSeller',
      isOnSale: false,
    ),
    ProductModel(
      id: '3',
      name: 'Minimal Sneakers',
      brand: 'Street Style',
      price: 89.00,
      oldPrice: 120.00,
      rating: 3.8,
      reviewsCount: 56,
      images: [
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
        'https://images.unsplash.com/photo-1608231387042-66d1773d3028',
        'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a',
      ],
      description: 'Clean and minimal sneakers designed for the modern urbanite. Features a lightweight sole, breathable upper, and versatile colorway that pairs with any outfit.',
      category: 'sale',
      isOnSale: true,
    ),
    ProductModel(
      id: '4',
      name: 'Wool Coat',
      brand: 'Winter Essentials',
      price: 220.00,
      oldPrice: null,
      rating: 4.9,
      reviewsCount: 412,
      images: [
        'https://images.unsplash.com/photo-1539533018447-63fcce2678e3',
        'https://images.unsplash.com/photo-1544022613-e87ca75a784a',
        'https://images.unsplash.com/photo-1548624313-0396c75e4b1a',
      ],
      description: 'Luxurious wool blend coat with a tailored silhouette. Features a double-breasted front, notch lapels, and side pockets. The perfect investment piece for the colder months.',
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