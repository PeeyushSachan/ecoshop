import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/category.dart' as cat;
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class CategoryDetailScreen extends StatefulWidget {
  final cat.Category category;

  const CategoryDetailScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String _sortBy = 'popular';
  bool _isGridView = true;
  
  // Sample products based on category
  List<ProductModel> get categoryProducts {
    // Generate mock products based on category
    switch (widget.category.id) {
      case 1: // Electronics
        return [
          ProductModel(
            id: 101,
            name: "iPhone 15 Pro Max",
            description: "Latest flagship smartphone with titanium design",
            images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
            price: 89999,
            mrp: 99999,
            rating: 4.8,
            reviews: 1234,
            categoryId: 1,
            variants: [
              ProductModelVariant(type: "color", options: ["Natural Titanium", "Blue Titanium"]),
              ProductModelVariant(type: "storage", options: ["128GB", "256GB", "512GB"])
            ],
            inStock: true,
            brand: "Apple",
          ),
          ProductModel(
            id: 102,
            name: "Samsung Galaxy S24 Ultra",
            description: "Flagship Android smartphone with S Pen",
            images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
            price: 79999,
            mrp: 89999,
            rating: 4.6,
            reviews: 890,
            categoryId: 1,
            variants: [
              ProductModelVariant(type: "color", options: ["Titanium Black", "Titanium Gray"]),
              ProductModelVariant(type: "storage", options: ["256GB", "512GB", "1TB"])
            ],
            inStock: true,
            brand: "Samsung",
          ),
          ProductModel(
            id: 103,
            name: "MacBook Air M2",
            description: "Lightweight laptop with M2 chip",
            images: ["https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400"],
            price: 94999,
            mrp: 104999,
            rating: 4.9,
            reviews: 567,
            categoryId: 1,
            variants: [
              ProductModelVariant(type: "color", options: ["Space Gray", "Silver", "Gold"]),
              ProductModelVariant(type: "memory", options: ["8GB", "16GB", "24GB"])
            ],
            inStock: true,
            brand: "Apple",
          ),
        ];
      
      case 2: // Fashion
        return [
          ProductModel(
            id: 201,
            name: "Nike Air Max 270",
            description: "Comfortable running shoes with Max Air cushioning",
            images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
            price: 8999,
            mrp: 12999,
            rating: 4.6,
            reviews: 892,
            categoryId: 2,
            variants: [
              ProductModelVariant(type: "size", options: ["7", "8", "9", "10", "11"]),
              ProductModelVariant(type: "color", options: ["Black", "White", "Navy"])
            ],
            inStock: true,
            brand: "Nike",
          ),
          ProductModel(
            id: 202,
            name: "Levi's 501 Original Jeans",
            description: "Classic straight-leg jeans with authentic vintage fit",
            images: ["https://images.unsplash.com/photo-1542272604-787c3835535d?w=400"],
            price: 3999,
            mrp: 5999,
            rating: 4.4,
            reviews: 2134,
            categoryId: 2,
            variants: [
              ProductModelVariant(type: "size", options: ["28", "30", "32", "34", "36"]),
              ProductModelVariant(type: "color", options: ["Dark Blue", "Light Blue", "Black"])
            ],
            inStock: true,
            brand: "Levi's",
          ),
          ProductModel(
            id: 203,
            name: "Adidas Ultraboost 22",
            description: "Revolutionary running shoes with boost technology",
            images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
            price: 12999,
            mrp: 16999,
            rating: 4.5,
            reviews: 678,
            categoryId: 2,
            variants: [
              ProductModelVariant(type: "size", options: ["7", "8", "9", "10", "11"]),
              ProductModelVariant(type: "color", options: ["Black", "White", "Blue"])
            ],
            inStock: true,
            brand: "Adidas",
          ),
        ];
      
      default:
        // Generate generic products for other categories
        return List.generate(6, (index) => ProductModel(
          id: (widget.category.id * 100) + index,
          name: "${widget.category.name} Product ${index + 1}",
          description: "High-quality ${widget.category.name.toLowerCase()} product with premium features",
          images: ["https://picsum.photos/400/400?random=${widget.category.id}$index"],
          price: (index + 1) * 1000 + 999,
          mrp: (index + 1) * 1200 + 999,
          rating: 4.0 + (index * 0.1),
          reviews: (index + 1) * 50 + 20,
          categoryId: widget.category.id,
          variants: [
            ProductModelVariant(type: "color", options: ["Black", "White", "Blue"]),
            ProductModelVariant(type: "size", options: ["S", "M", "L", "XL"])
          ],
          inStock: true,
          brand: "Brand ${String.fromCharCode(65 + index)}",
        ));
    }
  }

  List<ProductModel> get sortedProducts {
    List<ProductModel> products = List.from(categoryProducts);
    
    switch (_sortBy) {
      case 'price_low':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'rating':
        products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'newest':
        products.sort((a, b) => b.id.compareTo(a.id));
        break;
      default: // popular
        products.sort((a, b) => b.reviews.compareTo(a.reviews));
    }
    
    return products;
  }

  @override
  Widget build(BuildContext context) {
    final products = sortedProducts;
    
    // Parse category color
    Color categoryColor = AppTheme.accentColor;
    try {
      categoryColor = Color(int.parse(widget.category.color.replaceFirst('#', '0xFF')));
    } catch (e) {
      debugPrint('Error parsing color: $e');
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar with Category Info
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          categoryColor,
                          categoryColor.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Category Icon
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Center(
                                child: Text(
                                  widget.category.icon,
                                  style: const TextStyle(fontSize: 32),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            // Category Name
                            Text(
                              widget.category.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            
                            // Product Count
                            Text(
                              '${products.length} products available',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Search in category
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      // Filter products
                    },
                    icon: const Icon(Icons.filter_list, color: Colors.white),
                  ),
                ],
              ),

              // Sort and View Toggle
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Sort Button
                      Expanded(
                        child: GestureDetector(
                          onTap: () => _showSortBottomSheet(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: categoryColor.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.sort, size: 18),
                                const SizedBox(width: 8),
                                Text(
                                  _getSortLabel(_sortBy),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // View Toggle
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: categoryColor.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isGridView = true;
                                });
                              },
                              icon: Icon(
                                Icons.grid_view,
                                color: _isGridView ? categoryColor : AppTheme.textMuted,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _isGridView = false;
                                });
                              },
                              icon: Icon(
                                Icons.view_list,
                                color: !_isGridView ? categoryColor : AppTheme.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Products Grid/List
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: _isGridView ? _buildProductsGrid(products) : _buildProductsList(products),
              ),
              
              // Bottom Padding
              const SliverToBoxAdapter(
                child: SizedBox(height: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsGrid(List<ProductModel> products) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return ProductCard(
            product: products[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: products[index],
                  ),
                ),
              );
            },
            onWishlistTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Added to wishlist'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
          );
        },
        childCount: products.length,
      ),
    );
  }

  Widget _buildProductsList(List<ProductModel> products) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final product = products[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: AppTheme.cardDecoration,
            child: Row(
              children: [
                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.images.isNotEmpty ? product.images.first : 'https://via.placeholder.com/200',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.surfaceColor,
                          child: const Icon(Icons.image_not_supported, color: AppTheme.textMuted),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Product Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (product.brand != null)
                        Text(
                          product.brand!,
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      const SizedBox(height: 8),
                      
                      // Rating
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppTheme.successColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.star, color: Colors.white, size: 12),
                                const SizedBox(width: 2),
                                Text(
                                  product.rating.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${product.reviews})',
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      
                      // Price
                      Row(
                        children: [
                          Text(
                            product.formattedPrice,
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (product.discountPercentage > 0) ...[
                            Text(
                              product.formattedMrp,
                              style: const TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 12,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              product.formattedDiscount,
                              style: const TextStyle(
                                color: AppTheme.successColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                
                // Actions
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Add to wishlist
                      },
                      icon: const Icon(Icons.favorite_border, color: AppTheme.textMuted),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_forward_ios, color: AppTheme.textMuted, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        childCount: products.length,
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.backgroundDark,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sort By',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...[
                ('popular', 'Popularity'),
                ('price_low', 'Price: Low to High'),
                ('price_high', 'Price: High to Low'),
                ('rating', 'Customer Rating'),
                ('newest', 'Newest First'),
              ].map((option) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    option.$2,
                    style: TextStyle(
                      color: _sortBy == option.$1 ? AppTheme.accentColor : AppTheme.textSecondary,
                      fontWeight: _sortBy == option.$1 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  trailing: _sortBy == option.$1 
                      ? const Icon(Icons.check, color: AppTheme.accentColor)
                      : null,
                  onTap: () {
                    setState(() {
                      _sortBy = option.$1;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  String _getSortLabel(String sortBy) {
    switch (sortBy) {
      case 'price_low': return 'Price ↑';
      case 'price_high': return 'Price ↓';
      case 'rating': return 'Rating';
      case 'newest': return 'Newest';
      default: return 'Popular';
    }
  }
}