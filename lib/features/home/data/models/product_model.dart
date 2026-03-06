class ProductModel {
  final String id;
  final String name;
  final String brand;
  final double price;
  final double? oldPrice;
  final List<String> images;
  final String description;
  final bool isOnSale;
  final bool isFavorite;
  final String category;
  final double rating;
  final int reviewsCount;

  const ProductModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.price,
    this.oldPrice,
    required this.images,
    required this.description,
    required this.category,
    required this.rating,
    required this.reviewsCount,
    this.isOnSale = false,
    this.isFavorite = false,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      brand: json['brand'],
      price: json['price'].toDouble(),
      oldPrice: json['oldPrice']?.toDouble(),
      images: List<String>.from(json['images']),
      description: json['description'],
      category: json['category'],
      rating: json['rating'].toDouble(),
      reviewsCount: json['reviewsCount'],
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
      'oldPrice': oldPrice,
      'images': images,
      'description': description,
      'category': category,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'isOnSale': isOnSale,
      'isFavorite': isFavorite,
    };
  }

  ProductModel copyWith({
    String? id,
    String? name,
    String? brand,
    double? price,
    double? oldPrice,
    List<String>? images,
    String? description,
    String? category,
    double? rating,
    int? reviewsCount,
    bool? isOnSale,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      images: images ?? this.images,
      description: description ?? this.description,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      isOnSale: isOnSale ?? this.isOnSale,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}