import 'package:flutter/material.dart';
import '../theme/app_theme.dart';


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