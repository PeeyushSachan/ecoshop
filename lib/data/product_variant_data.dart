// DETAILED PRODUCT VARIANT FIXES & IMPROVEMENTS
// File: lib/models/product_variant.dart
import 'package:ecoshop/models/product_variant_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'product_variant_data.dart';





// IMPROVED SAMPLE PRODUCT VARIANTS
// File: lib/data/product_variants_data.dart

class ProductVariantsData {
  
  // FIXED: iPhone variants with proper structure
  static List<ProductVariantModel> getiPhoneVariants() {
    return [
      ProductVariantModel(
        type: "color",
        displayName: "Color",
        options: [
          VariantOptionModel(
            id: "natural_titanium",
            name: "Natural Titanium",
            colorHex: "#8C7853",
            available: true,
            stock: 25,
          ),
          VariantOptionModel(
            id: "blue_titanium", 
            name: "Blue Titanium",
            colorHex: "#395B74",
            available: true,
            stock: 18,
          ),
          VariantOptionModel(
            id: "white_titanium",
            name: "White Titanium", 
            colorHex: "#F5F5DC",
            available: true,
            stock: 12,
          ),
          VariantOptionModel(
            id: "black_titanium",
            name: "Black Titanium",
            colorHex: "#1C1C1E",
            available: false, // Out of stock example
            stock: 0,
          ),
        ],
      ),
      ProductVariantModel(
        type: "storage",
        displayName: "Storage",
        options: [
          VariantOptionModel(
            id: "128gb",
            name: "128GB",
            priceAdjustment: 0,
            available: true,
            stock: 45,
          ),
          VariantOptionModel(
            id: "256gb",
            name: "256GB",
            priceAdjustment: 10000,
            available: true,
            stock: 32,
          ),
          VariantOptionModel(
            id: "512gb",
            name: "512GB",
            priceAdjustment: 20000,
            available: true,
            stock: 28,
          ),
          VariantOptionModel(
            id: "1tb",
            name: "1TB",
            priceAdjustment: 35000,
            available: true,
            stock: 15,
          ),
        ],
      ),
    ];
  }

  // ADDED: Nike Shoes variants
  static List<ProductVariantModel> getNikeShoesVariants() {
    return [
      ProductVariantModel(
        type: "size",
        displayName: "Size (US)",
        options: [
          VariantOptionModel(id: "7", name: "7", available: true, stock: 8),
          VariantOptionModel(id: "7.5", name: "7.5", available: true, stock: 5),
          VariantOptionModel(id: "8", name: "8", available: true, stock: 12),
          VariantOptionModel(id: "8.5", name: "8.5", available: true, stock: 10),
          VariantOptionModel(id: "9", name: "9", available: true, stock: 15),
          VariantOptionModel(id: "9.5", name: "9.5", available: true, stock: 8),
          VariantOptionModel(id: "10", name: "10", available: true, stock: 6),
          VariantOptionModel(id: "10.5", name: "10.5", available: false, stock: 0),
          VariantOptionModel(id: "11", name: "11", available: true, stock: 4),
        ],
      ),
      ProductVariantModel(
        type: "color",
        displayName: "Color",
        options: [
          VariantOptionModel(
            id: "black",
            name: "Black",
            colorHex: "#000000",
            available: true,
            stock: 25,
          ),
          VariantOptionModel(
            id: "white", 
            name: "White",
            colorHex: "#FFFFFF",
            available: true,
            stock: 20,
          ),
          VariantOptionModel(
            id: "navy",
            name: "Navy",
            colorHex: "#1B263B",
            available: true,
            stock: 15,
          ),
          VariantOptionModel(
            id: "red",
            name: "Red",
            colorHex: "#DC2626",
            available: false,
            stock: 0,
          ),
        ],
      ),
    ];
  }

  // ADDED: MacBook variants
  static List<ProductVariantModel> getMacBookVariants() {
    return [
      ProductVariantModel(
        type: "color",
        displayName: "Finish",
        options: [
          VariantOptionModel(
            id: "space_gray",
            name: "Space Gray",
            colorHex: "#7D7D7D",
            available: true,
            stock: 12,
          ),
          VariantOptionModel(
            id: "silver",
            name: "Silver", 
            colorHex: "#E5E5E7",
            available: true,
            stock: 15,
          ),
          VariantOptionModel(
            id: "gold",
            name: "Gold",
            colorHex: "#FAD5A5",
            available: true,
            stock: 8,
          ),
          VariantOptionModel(
            id: "starlight",
            name: "Starlight",
            colorHex: "#FAF0E6",
            available: true,
            stock: 10,
          ),
        ],
      ),
      ProductVariantModel(
        type: "memory",
        displayName: "Unified Memory",
        options: [
          VariantOptionModel(
            id: "8gb",
            name: "8GB",
            priceAdjustment: 0,
            available: true,
            stock: 20,
          ),
          VariantOptionModel(
            id: "16gb",
            name: "16GB",
            priceAdjustment: 20000,
            available: true,
            stock: 15,
          ),
          VariantOptionModel(
            id: "24gb",
            name: "24GB",
            priceAdjustment: 40000,
            available: true,
            stock: 8,
          ),
        ],
      ),
      ProductVariantModel(
        type: "storage",
        displayName: "SSD Storage",
        options: [
          VariantOptionModel(
            id: "256gb",
            name: "256GB SSD",
            priceAdjustment: 0,
            available: true,
            stock: 25,
          ),
          VariantOptionModel(
            id: "512gb",
            name: "512GB SSD",
            priceAdjustment: 20000,
            available: true,
            stock: 18,
          ),
          VariantOptionModel(
            id: "1tb",
            name: "1TB SSD",
            priceAdjustment: 40000,
            available: true,
            stock: 12,
          ),
          VariantOptionModel(
            id: "2tb",
            name: "2TB SSD",
            priceAdjustment: 80000,
            available: true,
            stock: 5,
          ),
        ],
      ),
    ];
  }
}

