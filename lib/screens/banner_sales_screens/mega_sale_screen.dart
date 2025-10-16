import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../widgets/product_card.dart';
import '../product_detail_screen.dart';

class MegaSaleScreen extends StatefulWidget {
  const MegaSaleScreen({Key? key}) : super(key: key);

  @override
  State<MegaSaleScreen> createState() => _MegaSaleScreenState();
}

class _MegaSaleScreenState extends State<MegaSaleScreen> {
  bool _isGridView = true;
  String _sortBy = 'discount';
  late Timer _timer;
  Duration _timeLeft = const Duration(hours: 23, minutes: 45, seconds: 30);

  // Sample Sale Products
final List<ProductModel> saleProducts = [
  ProductModel(
    id: 1001,
    name: "iPhone 14 Pro Max",
    description: "Latest flagship smartphone with advanced camera system",
    images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
    price: 59999,
    mrp: 99999,
    rating: 4.8,
    reviews: 1234,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Space Black", "Deep Purple", "Gold", "Silver"]
            .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["128GB", "256GB", "512GB", "1TB"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 1002,
    name: "Samsung Galaxy S23 Ultra",
    description: "Premium Android smartphone with S Pen",
    images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
    price: 49999,
    mrp: 79999,
    rating: 4.7,
    reviews: 892,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Phantom Black", "Cream", "Green"]
            .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["256GB", "512GB", "1TB"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Samsung",
  ),
  ProductModel(
    id: 1003,
    name: "MacBook Air M2",
    description: "Lightweight laptop with M2 chip",
    images: ["https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400"],
    price: 69999,
    mrp: 119900,
    rating: 4.9,
    reviews: 567,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Space Gray", "Silver", "Gold", "Starlight"]
            .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "memory",
        options: ["8GB", "16GB", "24GB"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 1004,
    name: "Nike Air Jordan 1",
    description: "Classic basketball sneakers",
    images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
    price: 4999,
    mrp: 12995,
    rating: 4.6,
    reviews: 743,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["7", "8", "9", "10", "11"]
            .map((e) => VariantOptionModel(id: e, name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Black/Red", "White/Black", "Royal Blue"]
            .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-').replaceAll('/', '-'), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Nike",
  ),
  ProductModel(
    id: 1005,
    name: "Sony WH-1000XM5",
    description: "Premium noise-canceling headphones",
    images: ["https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400"],
    price: 14999,
    mrp: 29990,
    rating: 4.8,
    reviews: 456,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Black", "Silver"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Sony",
  ),
];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft.inSeconds > 0) {
          _timeLeft = Duration(seconds: _timeLeft.inSeconds - 1);
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String get _formattedTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(_timeLeft.inHours);
    String minutes = twoDigits(_timeLeft.inMinutes.remainder(60));
    String seconds = twoDigits(_timeLeft.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

  List<ProductModel> get _sortedProducts {
    List<ProductModel> products = List.from(saleProducts);
    
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
      case 'discount':
        products.sort((a, b) => b.discountPercentage.compareTo(a.discountPercentage));
        break;
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
                    const Expanded(
                      child: Text(
                        'Mega Sale',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Share sale
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sharing Mega Sale...')),
                        );
                      },
                      icon: const Icon(Icons.share, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Sale Header
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red[600]!, Colors.red[800]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.local_fire_department, color: Colors.white, size: 32),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'MEGA SALE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Up to 70% OFF',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '${saleProducts.length} Items',
                              style: TextStyle(
                                color: Colors.red[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.timer, color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                            const Text(
                              'Sale ends in: ',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Text(
                              _formattedTime,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Sort and View Controls
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _showSortBottomSheet(),
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
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Products List
              Expanded(
                child: _isGridView ? _buildGridView() : _buildListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    final products = _sortedProducts;
    
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
              onWishlistTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} added to wishlist'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              },
            ),
            // Sale Badge
            if (product.discountPercentage > 0)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${product.discountPercentage.round()}% OFF',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildListView() {
    final products = _sortedProducts;
    
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: AppTheme.cardDecoration,
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            leading: Stack(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      product.images.isNotEmpty ? product.images.first : '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.surfaceColor,
                          child: const Icon(Icons.image, color: AppTheme.textMuted),
                        );
                      },
                    ),
                  ),
                ),
                if (product.discountPercentage > 0)
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        '${product.discountPercentage.round()}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            title: Text(
              product.name,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.brand ?? '',
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      product.formattedPrice,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (product.discountPercentage > 0)
                      Text(
                        product.formattedMrp,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(productModel: product),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showSortBottomSheet() {
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
                ('discount', 'Best Discount', Icons.local_offer),
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
      case 'price_low': return 'Price ↑';
      case 'price_high': return 'Price ↓';
      case 'rating': return 'Rating';
      default: return 'Best Discount';
    }
  }
}