// IMPROVED CATEGORIES AND PRODUCT VARIANTS
// File: 

import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../theme/app_theme.dart';

class CategoryData {
final int id;
    final String name;
  final String icon;
  final String color; // Add this line

  CategoryData({
    required this.id,
    required this.name,
    required this.icon,
    required this.color, // Add this line
    // other fields...
  });
  // Enhanced Categories with more variety and better color distribution
  static final List<CategoryData> categories = [
    CategoryData(id: 1, name: "Electronics", icon: "📱", color: "#10B981"),
    CategoryData(id: 2, name: "Fashion", icon: "👕", color: "#8B5CF6"),
    CategoryData(id: 3, name: "Home & Garden", icon: "🏠", color: "#F59E0B"),
    CategoryData(id: 4, name: "Sports & Fitness", icon: "⚽", color: "#EF4444"),
    CategoryData(id: 5, name: "Beauty & Care", icon: "💄", color: "#EC4899"),
    CategoryData(id: 6, name: "Books & Media", icon: "📚", color: "#3B82F6"),
    CategoryData(id: 7, name: "Automotive", icon: "🚗", color: "#059669"),
    CategoryData(id: 8, name: "Baby & Kids", icon: "🍼", color: "#F97316"),
    CategoryData(id: 9, name: "Grocery", icon: "🛒", color: "#84CC16"),
    CategoryData(id: 10, name: "Health", icon: "⚕️", color: "#06B6D4"),
  ];

  // Enhanced Product Variants with more realistic options
 // Enhanced Product Variants with more realistic options
  static List<ProductVariantModel> getSmartphoneVariants() {
    return [
      ProductVariantModel(
          type: "color",
          options: [
            "Natural Titanium",
            "Blue Titanium",
            "White Titanium",
            "Black Titanium",
            "Gold Titanium"
          ]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
      ProductVariantModel(
          type: "storage",
          options: ["128GB", "256GB", "512GB", "1TB"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "ram",
          options: ["8GB", "12GB"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getClothingVariants() {
    return [
      ProductVariantModel(
          type: "size",
          options: ["XS", "S", "M", "L", "XL", "XXL", "3XL"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "color",
          options: [
            "Black",
            "White",
            "Navy Blue",
            "Grey",
            "Red",
            "Green",
            "Yellow",
            "Pink"
          ]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
      ProductVariantModel(
          type: "fit",
          options: ["Slim Fit", "Regular Fit", "Relaxed Fit"]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getShoesVariants() {
    return [
      ProductVariantModel(
          type: "size",
          options: [
            "6",
            "6.5",
            "7",
            "7.5",
            "8",
            "8.5",
            "9",
            "9.5",
            "10",
            "10.5",
            "11",
            "12"
          ].map((e) => VariantOptionModel(id: e, name: e)).toList()),
      ProductVariantModel(
          type: "color",
          options: [
            "Black",
            "White",
            "Navy",
            "Red",
            "Grey",
            "Brown",
            "Blue",
            "Green"
          ]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
      ProductVariantModel(
          type: "width",
          options: ["Regular", "Wide"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getLaptopVariants() {
    return [
      ProductVariantModel(
          type: "processor",
          options: [
            "Intel i5",
            "Intel i7",
            "Intel i9",
            "AMD Ryzen 5",
            "AMD Ryzen 7"
          ]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
      ProductVariantModel(
          type: "ram",
          options: ["8GB", "16GB", "32GB", "64GB"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "storage",
          options: ["256GB SSD", "512GB SSD", "1TB SSD", "2TB SSD"]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
      ProductVariantModel(
          type: "color",
          options: ["Space Gray", "Silver", "Gold", "Rose Gold"]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getHeadphonesVariants() {
    return [
      ProductVariantModel(
          type: "color",
          options: ["Black", "White", "Silver", "Blue", "Red"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "connectivity",
          options: ["Wired", "Wireless", "Both"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getFurnitureVariants() {
    return [
      ProductVariantModel(
          type: "size",
          options: ["Single", "Double", "Queen", "King", "Super King"]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
      ProductVariantModel(
          type: "color",
          options: ["White", "Oak", "Walnut", "Black", "Cherry", "Pine"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "material",
          options: ["Wood", "Metal", "Fabric", "Leather", "Plastic"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getCosmeticsVariants() {
    return [
      ProductVariantModel(
          type: "shade",
          options: [
            "Fair",
            "Light",
            "Medium",
            "Tan",
            "Deep",
            "Dark",
            "Nude",
            "Pink",
            "Red",
            "Brown"
          ]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "size",
          options: ["Travel Size", "Regular", "Large", "Extra Large"]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList()),
      ProductVariantModel(
          type: "finish",
          options: ["Matte", "Glossy", "Satin", "Shimmer"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getBooksVariants() {
    return [
      ProductVariantModel(
          type: "format",
          options: ["Paperback", "Hardcover", "eBook", "Audiobook"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "language",
          options: ["English", "Hindi", "Spanish", "French", "German"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
    ];
  }

  static List<ProductVariantModel> getSportsVariants() {
    return [
      ProductVariantModel(
          type: "size",
          options: ["XS", "S", "M", "L", "XL", "XXL"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "color",
          options: ["Black", "White", "Red", "Blue", "Green", "Yellow"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
      ProductVariantModel(
          type: "weight",
          options: ["Light", "Medium", "Heavy"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList()),
    ];
  }

  // Method to get variants based on category
  static List<ProductVariantModel> getVariantsByCategory(int categoryId) {
    switch (categoryId) {
      case 1: // Electronics
        return getLaptopVariants(); // More generic for electronics
      case 2: // Fashion
        return getClothingVariants();
      case 3: // Home & Garden
        return getFurnitureVariants();
      case 4: // Sports
        return getSportsVariants();
      case 5: // Beauty
        return getCosmeticsVariants();
      case 6: // Books
        return getBooksVariants();
      default:
        return [
          ProductVariantModel(
              type: "color",
              options: ["Black", "White", "Grey"]
                  .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
                  .toList()),
          ProductVariantModel(
              type: "size",
              options: ["S", "M", "L"]
                  .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
                  .toList()),
        ];
    }
  }
}

