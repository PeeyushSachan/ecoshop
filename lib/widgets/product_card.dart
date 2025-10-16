import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/product_model.dart' as models;
import '../data/category_data.dart'; // Ensure this file exports a 'Category' class

class ProductCard extends StatelessWidget {
  final models.ProductModel product;
  final VoidCallback? onTap;
  final VoidCallback? onWishlistTap;
  final bool isWishlisted;

  const ProductCard({
    Key? key,
    required this.product,
    this.onTap,
    this.onWishlistTap,
    this.isWishlisted = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: AppTheme.cardDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Product Image
            Expanded(
              flex: 4, // Increased flex for image
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        product.images.isNotEmpty 
                            ? product.images.first 
                            : 'https://via.placeholder.com/200',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppTheme.surfaceColor,
                            child: const Icon(
                              Icons.image_not_supported,
                              color: AppTheme.textMuted,
                              size: 30, // Reduced icon size
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  
                  // Discount Badge
                  if (product.discountPercentage > 0)
                    Positioned(
                      top: 6, // Reduced padding
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), // Reduced padding
                        decoration: BoxDecoration(
                          color: AppTheme.errorColor,
                          borderRadius: BorderRadius.circular(4), // Smaller radius
                        ),
                        child: Text(
                          product.formattedDiscount,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9, // Reduced font size
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    
                  // Wishlist Button
                  Positioned(
                    top: 6, // Reduced padding
                    right: 6,
                    child: GestureDetector(
                      onTap: onWishlistTap,
                      child: Container(
                        padding: const EdgeInsets.all(4), // Reduced padding
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isWishlisted ? Icons.favorite : Icons.favorite_border,
                          color: isWishlisted ? AppTheme.errorColor : Colors.white,
                          size: 16, // Reduced icon size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Product Details
            Flexible( // Changed from Expanded to Flexible
              flex: 3, // Reduced flex for details
              child: Padding(
                padding: const EdgeInsets.all(8), // Reduced padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Product Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 13, // Slightly reduced
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    // Conditional spacing and brand
                    if (product.brand != null) ...[
                      const SizedBox(height: 2), // Reduced spacing
                      Text(
                        product.brand!,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 11, // Reduced font size
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    
                    const SizedBox(height: 4), // Reduced spacing
                    
                    // Rating (Compact version)
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1), // Reduced padding
                          decoration: BoxDecoration(
                            color: AppTheme.successColor,
                            borderRadius: BorderRadius.circular(3), // Smaller radius
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 10, // Smaller icon
                              ),
                              const SizedBox(width: 1),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 9, // Smaller font
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 3),
                        Flexible( // Added Flexible to prevent overflow
                          child: Text(
                            '(${product.reviews})',
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 9, // Smaller font
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 6), // Reduced spacing
                    
                    // Price (Always at bottom)
                    Row(
                      children: [
                        Flexible( // Added Flexible to prevent overflow
                          child: Text(
                            product.formattedPrice,
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 14, // Slightly reduced
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (product.discountPercentage > 0) ...[
                          const SizedBox(width: 4), // Reduced spacing
                          Flexible( // Added Flexible to prevent overflow
                            child: Text(
                              product.formattedMrp,
                              style: const TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 11, // Reduced font size
                                decoration: TextDecoration.lineThrough,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

