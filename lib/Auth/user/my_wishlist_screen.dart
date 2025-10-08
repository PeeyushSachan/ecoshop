import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../widgets/product_card.dart';
import '../../screens/product_detail_screen.dart';

class MyWishlistScreen extends StatefulWidget {
  const MyWishlistScreen({Key? key}) : super(key: key);

  @override
  State<MyWishlistScreen> createState() => _MyWishlistScreenState();
}

class _MyWishlistScreenState extends State<MyWishlistScreen> {
  List<ProductModel> wishlistProducts = [
    ProductModel(
      id: 101,
      name: "iPhone 15 Pro Max",
      description: "Latest flagship smartphone with titanium design and advanced camera system",
      images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
      price: 89999,
      mrp: 99999,
      rating: 4.8,
      reviews: 1234,
      categoryId: 1,
      variants: [
        // ProductModelVariant(type: "color", options: ["Natural Titanium", "Blue Titanium"]),
        // ProductModelVariant(type: "storage", options: ["128GB", "256GB", "512GB"])
      ],
      inStock: true,
      brand: "Apple",
    ),
    ProductModel(
      id: 201,
      name: "Nike Air Max 270",
      description: "Comfortable running shoes with Max Air cushioning technology",
      images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
      price: 8999,
      mrp: 12999,
      rating: 4.6,
      reviews: 892,
      categoryId: 2,
      variants: [
        // ProductModelVariant(type: "size", options: ["7", "8", "9", "10", "11"]),
        // ProductModelVariant(type: "color", options: ["Black", "White", "Navy"])
      ],
      inStock: true,
      brand: "Nike",
    ),
    ProductModel(
      id: 301,
      name: "IKEA Malm Bed Frame",
      description: "Modern wooden bed frame with clean lines and ample storage space",
      images: ["https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400"],
      price: 12999,
      mrp: 15999,
      rating: 4.3,
      reviews: 234,
      categoryId: 3,
      variants: [
        // ProductModelVariant(type: "size", options: ["Single", "Double", "Queen"]),
        // ProductModelVariant(type: "color", options: ["White", "Oak", "Black-Brown"])
      ],
      inStock: true,
      brand: "IKEA",
    ),
    ProductModel(
      id: 501,
      name: "Lakme Absolute Lipstick",
      description: "Long-lasting matte lipstick with rich color payoff",
      images: ["https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=400"],
      price: 799,
      mrp: 999,
      rating: 4.3,
      reviews: 567,
      categoryId: 5,
      variants: [
        // ProductModelVariant(type: "shade", options: ["Red Envy", "Pink Crush", "Coral Blush"])
      ],
      inStock: false,
      brand: "Lakme",
    ),
    ProductModel(
      id: 601,
      name: "The Alchemist",
      description: "International bestseller by Paulo Coelho about following your dreams",
      images: ["https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400"],
      price: 299,
      mrp: 399,
      rating: 4.8,
      reviews: 1567,
      categoryId: 6,
      variants: [
        // ProductModelVariant(type: "format", options: ["Paperback", "Hardcover", "eBook"])
      ],
      inStock: true,
      brand: "HarperCollins",
    ),
  ];

  bool _isGridView = true;
  String _sortBy = 'added_date';

  List<ProductModel> get sortedProducts {
    List<ProductModel> products = List.from(wishlistProducts);
    
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
      case 'name':
        products.sort((a, b) => a.name.compareTo(b.name));
        break;
      default: // added_date
        products.sort((a, b) => b.id.compareTo(a.id));
    }
    
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Text(
                      'My Wishlist',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${wishlistProducts.length} items',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // Sort and View Controls
              if (wishlistProducts.isNotEmpty)
                Container(
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
                              border: Border.all(color: AppTheme.accentColor.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.sort, size: 18, color: AppTheme.accentColor),
                                const SizedBox(width: 8),
                                Text(
                                  _getSortLabel(_sortBy),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.textPrimary,
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
                          border: Border.all(color: AppTheme.accentColor.withOpacity(0.3)),
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
                                color: _isGridView ? AppTheme.accentColor : AppTheme.textMuted,
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
                                color: !_isGridView ? AppTheme.accentColor : AppTheme.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      
                      // Clear All Button
                      GestureDetector(
                        onTap: () => _showClearAllConfirmation(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: AppTheme.errorColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppTheme.errorColor.withOpacity(0.3)),
                          ),
                          child: const Text(
                            'Clear All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.errorColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // Wishlist Content
              Expanded(
                child: wishlistProducts.isEmpty ? _buildEmptyWishlist() : _buildWishlistContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyWishlist() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppTheme.accentColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Icon(
              Icons.favorite_border,
              size: 60,
              color: AppTheme.accentColor.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Your wishlist is empty',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Save items you love to your wishlist for later',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            decoration: AppTheme.primaryButtonDecoration,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.shopping_bag, color: Colors.white),
              label: const Text(
                'Start Shopping',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWishlistContent() {
    final products = sortedProducts;
    
    return _isGridView ? _buildGridView(products) : _buildListView(products);
  }

  Widget _buildGridView(List<ProductModel> products) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Stack(
          children: [
            ProductCard(
              product: product,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(productModel: product),
                  ),
                );
              },
              onWishlistTap: () => _removeFromWishlist(product),
              isWishlisted: true,
            ),
            // Add to Cart Button Overlay
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Container(
                height: 36,
                decoration: BoxDecoration(
                  color: AppTheme.accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton.icon(
                  onPressed: product.inStock 
                      ? () => _addToCart(product)
                      : null,
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  icon: Icon(
                    product.inStock ? Icons.shopping_cart : Icons.inventory_2,
                    color: Colors.white,
                    size: 16,
                  ),
                  label: Text(
                    product.inStock ? 'Add to Cart' : 'Out of Stock',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildListView(List<ProductModel> products) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: AppTheme.cardDecoration,
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                      if (product.brand != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'by ${product.brand}',
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
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
                      
                      const SizedBox(height: 12),
                      
                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: product.inStock 
                                  ? () => _addToCart(product)
                                  : null,
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: product.inStock ? AppTheme.accentColor : AppTheme.textMuted,
                                ),
                                foregroundColor: product.inStock ? AppTheme.accentColor : AppTheme.textMuted,
                                padding: const EdgeInsets.symmetric(vertical: 8),
                              ),
                              icon: Icon(
                                product.inStock ? Icons.shopping_cart : Icons.inventory_2,
                                size: 16,
                              ),
                              label: Text(
                                product.inStock ? 'Add to Cart' : 'Out of Stock',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () => _removeFromWishlist(product),
                            icon: const Icon(
                              Icons.favorite,
                              color: AppTheme.errorColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _removeFromWishlist(ProductModel product) {
    setState(() {
      wishlistProducts.removeWhere((p) => p.id == product.id);
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} removed from wishlist'),
        backgroundColor: AppTheme.errorColor,
        action: SnackBarAction(
          label: 'Undo',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              wishlistProducts.add(product);
            });
          },
        ),
      ),
    );
  }

  void _addToCart(ProductModel product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        backgroundColor: AppTheme.successColor,
        action: SnackBarAction(
          label: 'View Cart',
          textColor: Colors.white,
          onPressed: () {
            // Navigate to cart
          },
        ),
      ),
    );
  }

  void _showClearAllConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Clear Wishlist',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: Text(
          'Are you sure you want to remove all ${wishlistProducts.length} items from your wishlist?',
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                wishlistProducts.clear();
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Wishlist cleared'),
                  backgroundColor: AppTheme.errorColor,
                ),
              );
            },
            child: const Text(
              'Clear All',
              style: TextStyle(color: AppTheme.errorColor),
            ),
          ),
        ],
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
          padding: const EdgeInsets.all(20),
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
              const SizedBox(height: 20),
              ...[
                ('added_date', 'Recently Added', Icons.access_time),
                ('name', 'Name (A-Z)', Icons.sort_by_alpha),
                ('price_low', 'Price: Low to High', Icons.arrow_upward),
                ('price_high', 'Price: High to Low', Icons.arrow_downward),
                ('rating', 'Customer Rating', Icons.star),
              ].map((option) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    option.$3,
                    color: _sortBy == option.$1 ? AppTheme.accentColor : AppTheme.textMuted,
                  ),
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
      case 'name': return 'Name';
      case 'price_low': return 'Price ↑';
      case 'price_high': return 'Price ↓';
      case 'rating': return 'Rating';
      default: return 'Recent';
    }
  }
}