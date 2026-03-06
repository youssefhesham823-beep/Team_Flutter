class ProductModel {
  final String id;
  final String name;
  final String brand;
  final double price;
  final String image;
  final bool isOnSale;
  final bool isFavorite;
  final String category; // newIn, bestSeller, sale, all

  const ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    required this.image,
    required this.category,
    this.isOnSale = false,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: json['price'].toDouble(),
      image: json['image'],
      category: json['category'],
      isOnSale: json['isOnSale'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'image': image,
      'category': category,
      'isOnSale': isOnSale,
      'isFavorite': isFavorite,
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? brand,
    double? price,
    String? image,
    String? category,
    bool? isOnSale,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      image: image ?? this.image,
      category: category ?? this.category,
      isOnSale: isOnSale ?? this.isOnSale,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}