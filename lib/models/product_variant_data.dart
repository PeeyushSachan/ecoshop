// DETAILED PRODUCT VARIANT FIXES & IMPROVEMENTS
// File: lib/models/product_variant.dart
import 'package:ecoshop/models/product_varient_Model.dart';
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
          VariantOption(
            id: "natural_titanium",
            name: "Natural Titanium",
            colorHex: "#8C7853",
            available: true,
            stock: 25,
          ),
          VariantOption(
            id: "blue_titanium", 
            name: "Blue Titanium",
            colorHex: "#395B74",
            available: true,
            stock: 18,
          ),
          VariantOption(
            id: "white_titanium",
            name: "White Titanium", 
            colorHex: "#F5F5DC",
            available: true,
            stock: 12,
          ),
          VariantOption(
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
          VariantOption(
            id: "128gb",
            name: "128GB",
            priceAdjustment: 0,
            available: true,
            stock: 45,
          ),
          VariantOption(
            id: "256gb",
            name: "256GB",
            priceAdjustment: 10000,
            available: true,
            stock: 32,
          ),
          VariantOption(
            id: "512gb",
            name: "512GB",
            priceAdjustment: 20000,
            available: true,
            stock: 28,
          ),
          VariantOption(
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
          VariantOption(id: "7", name: "7", available: true, stock: 8),
          VariantOption(id: "7.5", name: "7.5", available: true, stock: 5),
          VariantOption(id: "8", name: "8", available: true, stock: 12),
          VariantOption(id: "8.5", name: "8.5", available: true, stock: 10),
          VariantOption(id: "9", name: "9", available: true, stock: 15),
          VariantOption(id: "9.5", name: "9.5", available: true, stock: 8),
          VariantOption(id: "10", name: "10", available: true, stock: 6),
          VariantOption(id: "10.5", name: "10.5", available: false, stock: 0),
          VariantOption(id: "11", name: "11", available: true, stock: 4),
        ],
      ),
      ProductVariantModel(
        type: "color",
        displayName: "Color",
        options: [
          VariantOption(
            id: "black",
            name: "Black",
            colorHex: "#000000",
            available: true,
            stock: 25,
          ),
          VariantOption(
            id: "white", 
            name: "White",
            colorHex: "#FFFFFF",
            available: true,
            stock: 20,
          ),
          VariantOption(
            id: "navy",
            name: "Navy",
            colorHex: "#1B263B",
            available: true,
            stock: 15,
          ),
          VariantOption(
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
          VariantOption(
            id: "space_gray",
            name: "Space Gray",
            colorHex: "#7D7D7D",
            available: true,
            stock: 12,
          ),
          VariantOption(
            id: "silver",
            name: "Silver", 
            colorHex: "#E5E5E7",
            available: true,
            stock: 15,
          ),
          VariantOption(
            id: "gold",
            name: "Gold",
            colorHex: "#FAD5A5",
            available: true,
            stock: 8,
          ),
          VariantOption(
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
          VariantOption(
            id: "8gb",
            name: "8GB",
            priceAdjustment: 0,
            available: true,
            stock: 20,
          ),
          VariantOption(
            id: "16gb",
            name: "16GB",
            priceAdjustment: 20000,
            available: true,
            stock: 15,
          ),
          VariantOption(
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
          VariantOption(
            id: "256gb",
            name: "256GB SSD",
            priceAdjustment: 0,
            available: true,
            stock: 25,
          ),
          VariantOption(
            id: "512gb",
            name: "512GB SSD",
            priceAdjustment: 20000,
            available: true,
            stock: 18,
          ),
          VariantOption(
            id: "1tb",
            name: "1TB SSD",
            priceAdjustment: 40000,
            available: true,
            stock: 12,
          ),
          VariantOption(
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

