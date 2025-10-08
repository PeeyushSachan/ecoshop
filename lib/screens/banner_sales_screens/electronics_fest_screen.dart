import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../widgets/product_card.dart';
import '../product_detail_screen.dart';

class ElectronicsFestScreen extends StatefulWidget {
  const ElectronicsFestScreen({Key? key}) : super(key: key);

  @override
  State<ElectronicsFestScreen> createState() => _ElectronicsFestScreenState();
}

class _ElectronicsFestScreenState extends State<ElectronicsFestScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isGridView = true;
  String _sortBy = 'popular';
  late Timer _timer;
  Duration _timeLeft = const Duration(days: 2, hours: 14, minutes: 23, seconds: 45);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _startTimer();
  }

  @override
  void dispose() {
    _tabController.dispose();
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
    String days = _timeLeft.inDays.toString();
    String hours = twoDigits(_timeLeft.inHours.remainder(24));
    String minutes = twoDigits(_timeLeft.inMinutes.remainder(60));
    String seconds = twoDigits(_timeLeft.inSeconds.remainder(60));
    return "${days}d ${hours}h ${minutes}m ${seconds}s";
  }

  // Sample Electronics Products
final List<ProductModel> smartphones = [
  ProductModel(
    id: 3001,
    name: "iPhone 15 Pro Max",
    description: "Latest flagship smartphone with titanium design",
    images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
    price: 89999,
    mrp: 99999,
    rating: 4.8,
    reviews: 1234,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Natural Titanium", "Blue Titanium", "White Titanium"]
            .map((e) => VariantOption(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["128GB", "256GB", "512GB", "1TB"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 3002,
    name: "Samsung Galaxy S24 Ultra",
    description: "Flagship Android with S Pen and AI features",
    images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
    price: 79999,
    mrp: 89999,
    rating: 4.6,
    reviews: 890,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Titanium Black", "Titanium Gray", "Titanium Violet"]
            .map((e) => VariantOption(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["256GB", "512GB", "1TB"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Samsung",
  ),
];

final List<ProductModel> laptops = [
  ProductModel(
    id: 3003,
    name: "MacBook Air M3",
    description: "Ultra-thin laptop with M3 chip",
    images: ["https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400"],
    price: 94999,
    mrp: 119900,
    rating: 4.9,
    reviews: 567,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Space Gray", "Silver", "Gold", "Starlight"]
            .map((e) => VariantOption(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "memory",
        options: ["8GB", "16GB", "24GB"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 3004,
    name: "Dell XPS 13",
    description: "Premium ultrabook with InfinityEdge display",
    images: ["https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400"],
    price: 79999,
    mrp: 99999,
    rating: 4.7,
    reviews: 432,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "processor",
        options: ["Intel i5", "Intel i7"]
            .map((e) => VariantOption(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["256GB", "512GB", "1TB"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Dell",
  ),
];

final List<ProductModel> tablets = [
  ProductModel(
    id: 3005,
    name: "iPad Pro 12.9-inch",
    description: "Most advanced iPad with M2 chip",
    images: ["https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400"],
    price: 84999,
    mrp: 94999,
    rating: 4.8,
    reviews: 723,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Space Gray", "Silver"]
            .map((e) => VariantOption(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["128GB", "256GB", "512GB", "1TB"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
];

final List<ProductModel> headphones = [
  ProductModel(
    id: 3006,
    name: "Sony WH-1000XM5",
    description: "Premium noise-canceling headphones",
    images: ["https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400"],
    price: 24990,
    mrp: 29990,
    rating: 4.7,
    reviews: 456,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Black", "Silver"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Sony",
  ),
  ProductModel(
    id: 3007,
    name: "AirPods Pro 2nd Gen",
    description: "Wireless earbuds with active noise cancellation",
    images: ["https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400"],
    price: 19999,
    mrp: 24900,
    rating: 4.6,
    reviews: 234,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["White"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
];

final List<ProductModel> smartwatches = [
  ProductModel(
    id: 3008,
    name: "Apple Watch Series 9",
    description: "Advanced smartwatch with health monitoring",
    images: ["https://images.unsplash.com/photo-1579586337278-3f436f25d4d0?w=400"],
    price: 39999,
    mrp: 44900,
    rating: 4.5,
    reviews: 678,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["41mm", "45mm"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Midnight", "Starlight", "Silver", "Red"]
            .map((e) => VariantOption(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
];

  List<ProductModel> get _currentProducts {
    switch (_tabController.index) {
      case 0: return [...smartphones, ...laptops, ...tablets, ...headphones, ...smartwatches];
      case 1: return smartphones;
      case 2: return laptops;
      case 3: return tablets;
      case 4: return [...headphones, ...smartwatches];
      default: return [];
    }
  }

  List<ProductModel> get _sortedProducts {
    List<ProductModel> products = List.from(_currentProducts);
    
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
      default: // popular
        products.sort((a, b) => b.reviews.compareTo(a.reviews));
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
                        'Electronics Fest',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Share electronics fest
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Sharing Electronics Fest...')),
                        );
                      },
                      icon: const Icon(Icons.share, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Electronics Fest Header
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[600]!, Colors.indigo[700]!],
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
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.devices,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ELECTRONICS FEST',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Latest Gadgets & Tech',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  'Up to 40% OFF',
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'FREE SHIPPING',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.access_time, color: Colors.white, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Festival ends in:',
                                  style: TextStyle(color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            Text(
                              _formattedTime,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
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

              // Tab Bar
              Container(
                decoration: const BoxDecoration(
                  color: AppTheme.surfaceColor,
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: AppTheme.accentColor,
                  unselectedLabelColor: AppTheme.textMuted,
                  indicatorColor: AppTheme.accentColor,
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'All (${_currentProducts.length})'),
                    Tab(text: 'Phones (${smartphones.length})'),
                    Tab(text: 'Laptops (${laptops.length})'),
                    Tab(text: 'Tablets (${tablets.length})'),
                    Tab(text: 'Audio (${headphones.length + smartwatches.length})'),
                  ],
                ),
              ),

              // Sort and View Controls
              Container(
                padding: const EdgeInsets.all(16),
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

              // Products Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(5, (index) {
                    return _isGridView ? _buildGridView() : _buildListView();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    final products = _sortedProducts;
    
    if (products.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.devices,
              size: 80,
              color: AppTheme.textMuted,
            ),
            SizedBox(height: 16),
            Text(
              'No electronics in this category',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

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
            // Tech Badge
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[600]!, Colors.indigo[700]!],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'TECH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Free Shipping Badge
            if (product.price > 10000)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'FREE SHIP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
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
    
    if (products.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.devices,
              size: 80,
              color: AppTheme.textMuted,
            ),
            SizedBox(height: 16),
            Text(
              'No electronics in this category',
              style: TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                Stack(
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
                              child: const Icon(Icons.devices, color: AppTheme.textMuted),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[600]!, Colors.indigo[700]!],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'TECH',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      const SizedBox(height: 4),
                      Text(
                        product.brand ?? '',
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
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
                      const SizedBox(height: 4),
                      if (product.price > 10000)
                        const Row(
                          children: [
                            Icon(Icons.local_shipping, color: Colors.orange, size: 12),
                            SizedBox(width: 4),
                            Text(
                              'Free Shipping',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                
                const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.textMuted),
              ],
            ),
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
                ('popular', 'Most Popular', Icons.trending_up),
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
      case 'discount': return 'Best Discount';
      default: return 'Popular';
    }
  }
}