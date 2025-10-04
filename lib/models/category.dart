// IMPROVED CATEGORIES AND PRODUCT VARIANTS
// File: lib/data/sample_data.dart

import 'package:flutter/material.dart';
import 'product.dart';
import '../theme/app_theme.dart';

class Category {
final int id;
    final String name;
  final String icon;
  final String color; // Add this line

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color, // Add this line
    // other fields...
  });
  // Enhanced Categories with more variety and better color distribution
  static final List<Category> categories = [
    Category(id: 1, name: "Electronics", icon: "📱", color: "#10B981"),
    Category(id: 2, name: "Fashion", icon: "👕", color: "#8B5CF6"),
    Category(id: 3, name: "Home & Garden", icon: "🏠", color: "#F59E0B"),
    Category(id: 4, name: "Sports & Fitness", icon: "⚽", color: "#EF4444"),
    Category(id: 5, name: "Beauty & Care", icon: "💄", color: "#EC4899"),
    Category(id: 6, name: "Books & Media", icon: "📚", color: "#3B82F6"),
    Category(id: 7, name: "Automotive", icon: "🚗", color: "#059669"),
    Category(id: 8, name: "Baby & Kids", icon: "🍼", color: "#F97316"),
    Category(id: 9, name: "Grocery", icon: "🛒", color: "#84CC16"),
    Category(id: 10, name: "Health", icon: "⚕️", color: "#06B6D4"),
  ];

  // Enhanced Product Variants with more realistic options
  static List<ProductVariant> getSmartphoneVariants() {
    return [
      ProductVariant(
        type: "color", 
        options: [
          "Natural Titanium", 
          "Blue Titanium", 
          "White Titanium", 
          "Black Titanium",
          "Gold Titanium"
        ]
      ),
      ProductVariant(
        type: "storage", 
        options: ["128GB", "256GB", "512GB", "1TB"]
      ),
      ProductVariant(
        type: "ram", 
        options: ["8GB", "12GB"]
      ),
    ];
  }

  static List<ProductVariant> getClothingVariants() {
    return [
      ProductVariant(
        type: "size", 
        options: ["XS", "S", "M", "L", "XL", "XXL", "3XL"]
      ),
      ProductVariant(
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
      ),
      ProductVariant(
        type: "fit", 
        options: ["Slim Fit", "Regular Fit", "Relaxed Fit"]
      ),
    ];
  }

  static List<ProductVariant> getShoesVariants() {
    return [
      ProductVariant(
        type: "size", 
        options: ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "12"]
      ),
      ProductVariant(
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
      ),
      ProductVariant(
        type: "width", 
        options: ["Regular", "Wide"]
      ),
    ];
  }

  static List<ProductVariant> getLaptopVariants() {
    return [
      ProductVariant(
        type: "processor", 
        options: ["Intel i5", "Intel i7", "Intel i9", "AMD Ryzen 5", "AMD Ryzen 7"]
      ),
      ProductVariant(
        type: "ram", 
        options: ["8GB", "16GB", "32GB", "64GB"]
      ),
      ProductVariant(
        type: "storage", 
        options: ["256GB SSD", "512GB SSD", "1TB SSD", "2TB SSD"]
      ),
      ProductVariant(
        type: "color", 
        options: ["Space Gray", "Silver", "Gold", "Rose Gold"]
      ),
    ];
  }

  static List<ProductVariant> getHeadphonesVariants() {
    return [
      ProductVariant(
        type: "color", 
        options: ["Black", "White", "Silver", "Blue", "Red"]
      ),
      ProductVariant(
        type: "connectivity", 
        options: ["Wired", "Wireless", "Both"]
      ),
    ];
  }

  static List<ProductVariant> getFurnitureVariants() {
    return [
      ProductVariant(
        type: "size", 
        options: ["Single", "Double", "Queen", "King", "Super King"]
      ),
      ProductVariant(
        type: "color", 
        options: ["White", "Oak", "Walnut", "Black", "Cherry", "Pine"]
      ),
      ProductVariant(
        type: "material", 
        options: ["Wood", "Metal", "Fabric", "Leather", "Plastic"]
      ),
    ];
  }

  static List<ProductVariant> getCosmeticsVariants() {
    return [
      ProductVariant(
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
      ),
      ProductVariant(
        type: "size", 
        options: ["Travel Size", "Regular", "Large", "Extra Large"]
      ),
      ProductVariant(
        type: "finish", 
        options: ["Matte", "Glossy", "Satin", "Shimmer"]
      ),
    ];
  }

  static List<ProductVariant> getBooksVariants() {
    return [
      ProductVariant(
        type: "format", 
        options: ["Paperback", "Hardcover", "eBook", "Audiobook"]
      ),
      ProductVariant(
        type: "language", 
        options: ["English", "Hindi", "Spanish", "French", "German"]
      ),
    ];
  }

  static List<ProductVariant> getSportsVariants() {
    return [
      ProductVariant(
        type: "size", 
        options: ["XS", "S", "M", "L", "XL", "XXL"]
      ),
      ProductVariant(
        type: "color", 
        options: ["Black", "White", "Red", "Blue", "Green", "Yellow"]
      ),
      ProductVariant(
        type: "weight", 
        options: ["Light", "Medium", "Heavy"]
      ),
    ];
  }

  // Method to get variants based on category
  static List<ProductVariant> getVariantsByCategory(int categoryId) {
    switch (categoryId) {
      case 1: // Electronics
        return getSmartphoneVariants();
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
          ProductVariant(type: "color", options: ["Black", "White", "Grey"]),
          ProductVariant(type: "size", options: ["S", "M", "L"]),
        ];
    }
  }
}

// CATEGORY FIXES AND IMPROVEMENTS
// File: lib/widgets/product_card.dart (Updated CategoryCard)

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryCard({
    Key? key,
    required this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FIXED: Better color parsing with error handling
    Color categoryColor = AppTheme.accentColor; // Default fallback
    try {
      categoryColor = Color(int.parse(category.color.replaceFirst('#', '0xFF')));
    } catch (e) {
      print('Error parsing color ${category.color}: $e');
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: categoryColor.withOpacity(0.3),
            width: 1.5,
          ),
          // ADDED: Subtle gradient background
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              categoryColor.withOpacity(0.05),
              categoryColor.withOpacity(0.02),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // IMPROVED: Better icon display
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: categoryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  category.icon,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              category.name,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// ENHANCED PRODUCT VARIANTS DISPLAY
// File: lib/screens/product_detail_screen.dart (Updated variant section)

// NOTE: The following widgets and variables must be placed inside the State class of a StatefulWidget,
// such as ProductDetailScreenState, to access setState and local state variables.

class ProductDetailScreen extends StatefulWidget {
  // Add your constructor and other properties as needed
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  Map<String, String> _selectedVariants = {};

  Widget _buildVariantSelector(ProductVariant variant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              variant.type.toUpperCase(),
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (_selectedVariants[variant.type] != null) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  _selectedVariants[variant.type]!,
                  style: const TextStyle(
                    color: AppTheme.accentColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 12),
        
        // IMPROVED: Better variant display based on type
        if (variant.type == "color")
          _buildColorVariants(variant)
        else if (variant.type == "size")
          _buildSizeVariants(variant)
        else
          _buildDefaultVariants(variant),
        
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildColorVariants(ProductVariant variant) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: variant.options.map((option) {
        bool isSelected = _selectedVariants[variant.type] == option;
        Color? optionColor = _getColorFromName(option);
        
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedVariants[variant.type] = option;
            });
          },
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: optionColor ?? AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? AppTheme.accentColor : Colors.transparent,
                width: 3,
              ),
              boxShadow: isSelected ? [
                BoxShadow(
                  color: AppTheme.accentColor.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ] : null,
            ),
            child: optionColor == null ? Center(
              child: Text(
                option.substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: isSelected ? AppTheme.accentColor : AppTheme.textSecondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ) : null,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSizeVariants(ProductVariant variant) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: variant.options.map((option) {
        bool isSelected = _selectedVariants[variant.type] == option;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedVariants[variant.type] = option;
            });
          },
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.accentColor : AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppTheme.accentColor : Colors.transparent,
              ),
            ),
            child: Center(
              child: Text(
                option,
                style: TextStyle(
                  color: isSelected ? Colors.white : AppTheme.textSecondary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDefaultVariants(ProductVariant variant) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: variant.options.map((option) {
        bool isSelected = _selectedVariants[variant.type] == option;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedVariants[variant.type] = option;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? AppTheme.accentColor : AppTheme.surfaceColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppTheme.accentColor : Colors.transparent,
              ),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : AppTheme.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Helper method to get color from name
  Color? _getColorFromName(String colorName) {
    const colorMap = {
      'black': Colors.black,
      'white': Colors.white,
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'pink': Colors.pink,
      'purple': Colors.purple,
      'orange': Colors.orange,
      'grey': Colors.grey,
      'gray': Colors.grey,
      'brown': Colors.brown,
      'navy': Color(0xFF000080),
      'titanium': Color(0xFF878681),
      'gold': Color(0xFFFFD700),
      'silver': Color(0xFFC0C0C0),
    };
    
    String cleanName = colorName.toLowerCase()
        .replaceAll(' titanium', '')
        .replaceAll(' blue', '')
        .replaceAll('natural ', '');
    
    return colorMap[cleanName];
  }

  @override
  Widget build(BuildContext context) {
    // Build your product detail screen here and use _buildVariantSelector where needed
    return Container(); // Replace with your actual UI
  }
}