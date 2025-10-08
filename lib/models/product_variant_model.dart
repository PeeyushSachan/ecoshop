import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';


class ProductVariantModel {
  final String type;
  final List<VariantOption> options; // IMPROVED: Using VariantOption class instead of just strings
  final bool required;
  final String? displayName;

  ProductVariantModel({
    required this.type,
    required this.options,
    this.required = true,
    this.displayName,
  });

  // ADDED: Helper method to get display name
  String get label => displayName ?? type.toUpperCase();

  factory ProductVariantModel.fromJson(Map<String, dynamic> json) {
    return ProductVariantModel(
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