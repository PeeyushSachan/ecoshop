// DETAILED PRODUCT VARIANT FIXES & IMPROVEMENTS
// File: lib/models/product_variant.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'product_variant.dart';

class ProductVariant {
  final String type;
  final List<VariantOption> options; // IMPROVED: Using VariantOption class instead of just strings
  final bool required;
  final String? displayName;

  ProductVariant({
    required this.type,
    required this.options,
    this.required = true,
    this.displayName,
  });

  // ADDED: Helper method to get display name
  String get label => displayName ?? type.toUpperCase();

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      type: json['type'],
      options: (json['options'] as List)
          .map((option) => VariantOption.fromJson(option))
          .toList(),
      required: json['required'] ?? true,
      displayName: json['display_name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'options': options.map((option) => option.toJson()).toList(),
      'required': required,
      'display_name': displayName,
    };
  }
}

// ENHANCED: VariantOption class for better data structure
class VariantOption {
  final String id;
  final String name;
  final String? displayName;
  final double? priceAdjustment;
  final String? colorHex;
  final String? image;
  final bool available;
  final int? stock;

  VariantOption({
    required this.id,
    required this.name,
    this.displayName,
    this.priceAdjustment = 0,
    this.colorHex,
    this.image,
    this.available = true,
    this.stock,
  });

  String get label => displayName ?? name;
  
  Color? get color {
    if (colorHex == null) return null;
    try {
      return Color(int.parse(colorHex!.replaceFirst('#', '0xFF')));
    } catch (e) {
      return null;
    }
  }

  factory VariantOption.fromJson(Map<String, dynamic> json) {
    return VariantOption(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
      priceAdjustment: json['price_adjustment']?.toDouble() ?? 0,
      colorHex: json['color_hex'],
      image: json['image'],
      available: json['available'] ?? true,
      stock: json['stock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'display_name': displayName,
      'price_adjustment': priceAdjustment,
      'color_hex': colorHex,
      'image': image,
      'available': available,
      'stock': stock,
    };
  }
}

// IMPROVED SAMPLE PRODUCT VARIANTS
// File: lib/data/product_variants_data.dart

class ProductVariantsData {
  
  // FIXED: iPhone variants with proper structure
  static List<ProductVariant> getiPhoneVariants() {
    return [
      ProductVariant(
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
      ProductVariant(
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
  static List<ProductVariant> getNikeShoesVariants() {
    return [
      ProductVariant(
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
      ProductVariant(
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
  static List<ProductVariant> getMacBookVariants() {
    return [
      ProductVariant(
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
      ProductVariant(
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
      ProductVariant(
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

// ENHANCED VARIANT SELECTOR WIDGET
// File: lib/widgets/variant_selector.dart



class VariantSelector extends StatefulWidget {
  final ProductVariant variant;
  final String? selectedValue;
  final Function(String) onChanged;
  final double basePrice;

  const VariantSelector({
    Key? key,
    required this.variant,
    required this.selectedValue,
    required this.onChanged,
    required this.basePrice,
  }) : super(key: key);

  @override
  State<VariantSelector> createState() => _VariantSelectorState();
}

class _VariantSelectorState extends State<VariantSelector> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // IMPROVED: Header with selected info
        _buildVariantHeader(),
        const SizedBox(height: 12),
        
        // ENHANCED: Different layouts based on variant type
        if (widget.variant.type == "color")
          _buildColorSelector()
        else if (widget.variant.type == "size")
          _buildSizeSelector()
        else
          _buildDefaultSelector(),
      ],
    );
  }

  Widget _buildVariantHeader() {
    VariantOption? selectedOption = widget.selectedValue != null
        ? widget.variant.options.firstWhere(
            (option) => option.id == widget.selectedValue,
            orElse: () => widget.variant.options.first,
          )
        : null;

    return Row(
      children: [
        Text(
          widget.variant.label,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (selectedOption != null) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: AppTheme.accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              selectedOption.label,
              style: const TextStyle(
                color: AppTheme.accentColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
        const Spacer(),
        // ADDED: Price adjustment indicator
        if (selectedOption?.priceAdjustment != null && selectedOption!.priceAdjustment! > 0)
          Text(
            '+₹${selectedOption.priceAdjustment!.toStringAsFixed(0)}',
            style: const TextStyle(
              color: AppTheme.accentColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildColorSelector() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: widget.variant.options.map((option) {
        bool isSelected = widget.selectedValue == option.id;
        bool isAvailable = option.available;
        
        return GestureDetector(
          onTap: isAvailable ? () => widget.onChanged(option.id) : null,
          child: Stack(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: option.color ?? Colors.grey,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected 
                        ? AppTheme.accentColor 
                        : Colors.white.withOpacity(0.3),
                    width: isSelected ? 3 : 1,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: AppTheme.accentColor.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 1,
                    ),
                  ] : null,
                ),
              ),
              
              // ADDED: Out of stock indicator
              if (!isAvailable)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              
              // ADDED: Selected indicator
              if (isSelected && isAvailable)
                const Positioned(
                  bottom: 2,
                  right: 2,
                  child: Icon(
                    Icons.check_circle,
                    color: AppTheme.accentColor,
                    size: 16,
                  ),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSizeSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.variant.options.map((option) {
        bool isSelected = widget.selectedValue == option.id;
        bool isAvailable = option.available;
        
        return GestureDetector(
          onTap: isAvailable ? () => widget.onChanged(option.id) : null,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: isSelected 
                  ? AppTheme.accentColor 
                  : isAvailable 
                      ? AppTheme.surfaceColor 
                      : AppTheme.surfaceColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppTheme.accentColor : Colors.transparent,
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    option.name,
                    style: TextStyle(
                      color: isSelected 
                          ? Colors.white 
                          : isAvailable 
                              ? AppTheme.textSecondary 
                              : AppTheme.textMuted,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                ),
                
                // ADDED: Low stock indicator
                if (isAvailable && option.stock != null && option.stock! <= 5)
                  Positioned(
                    top: 2,
                    right: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                
                // ADDED: Out of stock overlay
                if (!isAvailable)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDefaultSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.variant.options.map((option) {
        bool isSelected = widget.selectedValue == option.id;
        bool isAvailable = option.available;
        
        return GestureDetector(
          onTap: isAvailable ? () => widget.onChanged(option.id) : null,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected 
                  ? AppTheme.accentColor 
                  : isAvailable 
                      ? AppTheme.surfaceColor 
                      : AppTheme.surfaceColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? AppTheme.accentColor : Colors.transparent,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  option.label,
                  style: TextStyle(
                    color: isSelected 
                        ? Colors.white 
                        : isAvailable 
                            ? AppTheme.textSecondary 
                            : AppTheme.textMuted,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    fontSize: 14,
                  ),
                ),
                
                // ADDED: Price adjustment display
                if (option.priceAdjustment != null && option.priceAdjustment! > 0) ...[
                  const SizedBox(width: 8),
                  Text(
                    '+₹${option.priceAdjustment!.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: isSelected 
                          ? Colors.white70 
                          : AppTheme.accentColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
                
                // ADDED: Out of stock indicator
                if (!isAvailable) ...[
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.block,
                    color: AppTheme.errorColor,
                    size: 16,
                  ),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}