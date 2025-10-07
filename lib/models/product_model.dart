class ProductModel {
  final int id;
  final String name;
  final String description;
  final List<String> images;
  final double price;
  final double mrp;
  final double rating;
  final int reviews;
  final int categoryId;
  final List<ProductModelVariant> variants;
  final bool inStock;
  final String? brand;
  final List<String>? tags;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.price,
    required this.mrp,
    required this.rating,
    required this.reviews,
    required this.categoryId,
    required this.variants,
    required this.inStock,
    this.brand,
    this.tags,
  });

  double get discountPercentage {
    if (mrp <= 0) return 0;
    return ((mrp - price) / mrp * 100);
  }

  String get formattedPrice => '₹${price.toStringAsFixed(0)}';
  String get formattedMrp => '₹${mrp.toStringAsFixed(0)}';
  String get formattedDiscount => '${discountPercentage.toStringAsFixed(0)}% OFF';

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      images: List<String>.from(json['images']),
      price: json['price'].toDouble(),
      mrp: json['mrp'].toDouble(),
      rating: json['rating'].toDouble(),
      reviews: json['reviews'],
      categoryId: json['category_id'],
      variants: (json['variants'] as List)
          .map((v) => ProductModelVariant.fromJson(v))
          .toList(),
      inStock: json['in_stock'],
      brand: json['brand'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'price': price,
      'mrp': mrp,
      'rating': rating,
      'reviews': reviews,
      'category_id': categoryId,
      'variants': variants.map((v) => v.toJson()).toList(),
      'in_stock': inStock,
      'brand': brand,
      'tags': tags,
    };
  }
}


class ProductModelVariant {
  final String type;
  final List<String> options;

  ProductModelVariant({
    required this.type,
    required this.options,
  });

  factory ProductModelVariant.fromJson(Map<String, dynamic> json) {
    return ProductModelVariant(
      type: json['type'],
      options: List<String>.from(json['options']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'options': options,
    };
  }
}

// class Category {
//   final int id;
//   final String name;
//   final String icon;
//   final String color;
//   final String? image;

//   Category({
//     required this.id,
//     required this.name,
//     required this.icon,
//     required this.color,
//     this.image,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) {
//     return Category(
//       id: json['id'],
//       name: json['name'],
//       icon: json['icon'],
//       color: json['color'],
//       image: json['image'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'icon': icon,
//       'color': color,
//       'image': image,
//     };
//   }
// }




