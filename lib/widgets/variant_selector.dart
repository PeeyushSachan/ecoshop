// ENHANCED VARIANT SELECTOR WIDGET
// File: lib/widgets/variant_selector.dart



import 'package:ecoshop/models/product_varient_Model.dart';
import 'package:ecoshop/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:ecoshop/models/variant_option_model.dart';

class VariantSelector extends StatefulWidget {
  final ProductVariantModel variant;
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