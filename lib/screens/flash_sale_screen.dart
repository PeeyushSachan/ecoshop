import 'package:ecoshop/models/flash_sale_product_model.dart';
import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/app_theme.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class FlashSaleScreen extends StatefulWidget {
  const FlashSaleScreen({Key? key}) : super(key: key);

  @override
  State<FlashSaleScreen> createState() => _FlashSaleScreenState();
}

class _FlashSaleScreenState extends State<FlashSaleScreen> {
  bool _isGridView = true;
  String _sortBy = 'time_left';
  late Timer _timer;

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
        // Update flash sale timers
        for (var product in flashSaleProducts) {
          if (product.flashSaleEndTime != null && product.flashSaleEndTime!.isAfter(DateTime.now())) {
            // Timer still running
          }
        }
      });
    });
  }

  // Sample Flash Sale Products with timers
final List<FlashSaleProductModel> flashSaleProducts = [
  FlashSaleProductModel(
    product: ProductModel(
      id: 4001,
      name: "Wireless Earbuds Pro",
      description: "Premium sound quality with active noise cancellation",
      images: ["https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400"],
      price: 1999,
      mrp: 4999,
      rating: 4.5,
      reviews: 1234,
      categoryId: 1,
      variants: [
        ProductVariantModel(
          type: "color",
          options: ["Black", "White", "Blue"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList(),
        )
      ],
      inStock: true,
      brand: "TechSound",
    ),
    flashSaleEndTime: DateTime.now().add(const Duration(hours: 2, minutes: 15)),
    originalStock: 100,
    soldCount: 67,
    flashSalePrice: 1999,
  ),
  FlashSaleProductModel(
    product: ProductModel(
      id: 4002,
      name: "Smart Fitness Watch",
      description: "Track your health and fitness goals",
      images: ["https://images.unsplash.com/photo-1579586337278-3f436f25d4d0?w=400"],
      price: 2499,
      mrp: 6999,
      rating: 4.3,
      reviews: 892,
      categoryId: 1,
      variants: [
        ProductVariantModel(
          type: "color",
          options: ["Black", "Silver", "Rose Gold"]
              .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
              .toList(),
        )
      ],
      inStock: true,
      brand: "FitTech",
    ),
    flashSaleEndTime: DateTime.now().add(const Duration(hours: 1, minutes: 45)),
    originalStock: 50,
    soldCount: 32,
    flashSalePrice: 2499,
  ),
  FlashSaleProductModel(
    product: ProductModel(
      id: 4003,
      name: "Bluetooth Speaker",
      description: "Portable speaker with powerful bass",
      images: ["https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400"],
      price: 1499,
      mrp: 3999,
      rating: 4.6,
      reviews: 567,
      categoryId: 1,
      variants: [
        ProductVariantModel(
          type: "color",
          options: ["Black", "Red", "Blue"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList(),
        )
      ],
      inStock: true,
      brand: "SoundWave",
    ),
    flashSaleEndTime: DateTime.now().add(const Duration(hours: 3, minutes: 30)),
    originalStock: 75,
    soldCount: 45,
    flashSalePrice: 1499,
  ),
  FlashSaleProductModel(
    product: ProductModel(
      id: 4004,
      name: "Gaming Mouse",
      description: "High precision gaming mouse with RGB lighting",
      images: ["https://images.unsplash.com/photo-1527814050087-3793815479db?w=400"],
      price: 899,
      mrp: 2499,
      rating: 4.7,
      reviews: 432,
      categoryId: 1,
      variants: [
        ProductVariantModel(
          type: "color",
          options: ["Black", "White"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList(),
        )
      ],
      inStock: true,
      brand: "GamePro",
    ),
    flashSaleEndTime: DateTime.now().add(const Duration(minutes: 55)),
    originalStock: 30,
    soldCount: 28,
    flashSalePrice: 899,
  ),
  FlashSaleProductModel(
    product: ProductModel(
      id: 4005,
      name: "Wireless Charger",
      description: "Fast wireless charging pad for smartphones",
      images: ["https://images.unsplash.com/photo-1609592806516-b8e5b4e92b7b?w=400"],
      price: 799,
      mrp: 1999,
      rating: 4.2,
      reviews: 234,
      categoryId: 1,
      variants: [
        ProductVariantModel(
          type: "color",
          options: ["Black", "White"]
              .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
              .toList(),
        )
      ],
      inStock: true,
      brand: "ChargeFast",
    ),
    flashSaleEndTime: DateTime.now().add(const Duration(hours: 4, minutes: 20)),
    originalStock: 40,
    soldCount: 15,
    flashSalePrice: 799,
  ),
];

  List<FlashSaleProductModel> get _sortedProducts {
    List<FlashSaleProductModel> products = List.from(flashSaleProducts);

    switch (_sortBy) {
      case 'price_low':
        products.sort((a, b) => a.flashSalePrice.compareTo(b.flashSalePrice));
        break;
      case 'price_high':
        products.sort((a, b) => b.flashSalePrice.compareTo(a.flashSalePrice));
        break;
      case 'discount':
        products.sort((a, b) => b.discountPercentage.compareTo(a.discountPercentage));
        break;
      case 'popularity':
        products.sort((a, b) => b.soldCount.compareTo(a.soldCount));
        break;
      default: // time_left
        products.sort((a, b) => a.timeLeft.compareTo(b.timeLeft));
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
                        'Flash Sale',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showFlashSaleInfo();
                      },
                      icon: const Icon(Icons.info_outline, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Flash Sale Header
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange[600]!, Colors.red[600]!],
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
                              Icons.flash_on,
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
                                  'FLASH SALE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Limited Time Deals',
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
                                  'Up to 80% OFF',
                                  style: TextStyle(
                                    color: Colors.red[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.yellow[600],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Text(
                                  'HURRY UP!',
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
                            _buildStatItem('Total Deals', '${flashSaleProducts.length}'),
                            _buildStatItem('Sold Out', '${flashSaleProducts.where((p) => p.stockPercentage < 10).length}'),
                            _buildStatItem('Ending Soon', '${flashSaleProducts.where((p) => p.timeLeft.inHours < 1).length}'),
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

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildGridView() {
    final products = _sortedProducts;
    
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final flashProduct = products[index];
        return _buildFlashSaleCard(flashProduct);
      },
    );
  }

  Widget _buildListView() {
    final products = _sortedProducts;
    
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final flashProduct = products[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: AppTheme.cardDecoration,
          child: _buildFlashSaleListItem(flashProduct),
        );
      },
    );
  }

  Widget _buildFlashSaleCard(FlashSaleProductModel flashProduct) {
    final product = flashProduct.product;
    final timeLeft = flashProduct.timeLeft;
    final isEnding = timeLeft.inMinutes < 60;
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productModel: product),
          ),
        );
      },
      child: Container(
        decoration: AppTheme.cardDecoration.copyWith(
          border: Border.all(
            color: isEnding ? Colors.red : AppTheme.accentColor.withOpacity(0.3),
            width: isEnding ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with Badges
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        product.images.isNotEmpty ? product.images.first : '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppTheme.surfaceColor,
                            child: const Icon(Icons.flash_on, size: 40, color: AppTheme.accentColor),
                          );
                        },
                      ),
                    ),
                  ),
                  // Flash Sale Badge
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.orange[600]!, Colors.red[600]!],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.flash_on, color: Colors.white, size: 12),
                          const SizedBox(width: 2),
                          Text(
                            '${flashProduct.discountPercentage.round()}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Stock Badge
                  if (flashProduct.stockPercentage < 20)
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Only ${flashProduct.remainingStock} left',
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
            ),
            
            // Product Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timer
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isEnding ? Colors.red.withOpacity(0.2) : AppTheme.accentColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 12,
                            color: isEnding ? Colors.red : AppTheme.accentColor,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatDuration(timeLeft),
                            style: TextStyle(
                              color: isEnding ? Colors.red : AppTheme.accentColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Product Name
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    
                    // Price
                    Row(
                      children: [
                        Text(
                          '₹${flashProduct.flashSalePrice}',
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '₹${product.mrp}',
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Progress Bar
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sold: ${flashProduct.soldCount}',
                              style: const TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 10,
                              ),
                            ),
                            Text(
                              '${flashProduct.stockPercentage.round()}% left',
                              style: const TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        LinearProgressIndicator(
                          value: flashProduct.soldPercentage / 100,
                          backgroundColor: AppTheme.textMuted.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            flashProduct.stockPercentage < 20 ? Colors.red : AppTheme.accentColor,
                          ),
                        ),
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

  Widget _buildFlashSaleListItem(FlashSaleProductModel flashProduct) {
    final product = flashProduct.product;
    final timeLeft = flashProduct.timeLeft;
    final isEnding = timeLeft.inMinutes < 60;
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(productModel: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Product Image
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
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
                          child: const Icon(Icons.flash_on, color: AppTheme.accentColor),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange[600]!, Colors.red[600]!],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${flashProduct.discountPercentage.round()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
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
                  // Timer
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isEnding ? Colors.red.withOpacity(0.2) : AppTheme.accentColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timer,
                          size: 12,
                          color: isEnding ? Colors.red : AppTheme.accentColor,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatDuration(timeLeft),
                          style: TextStyle(
                            color: isEnding ? Colors.red : AppTheme.accentColor,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Product Name
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
                  
                  // Brand
                  Text(
                    product.brand ?? '',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Price
                  Row(
                    children: [
                      Text(
                        '₹${flashProduct.flashSalePrice}',
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '₹${product.mrp}',
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  
                  // Progress and Stock Info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sold: ${flashProduct.soldCount}/${flashProduct.originalStock}',
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                          if (flashProduct.stockPercentage < 20)
                            Text(
                              'Only ${flashProduct.remainingStock} left!',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: flashProduct.soldPercentage / 100,
                        backgroundColor: AppTheme.textMuted.withOpacity(0.3),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          flashProduct.stockPercentage < 20 ? Colors.red : AppTheme.accentColor,
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
  }

  String _formatDuration(Duration duration) {
    if (duration.inHours > 0) {
      return '${duration.inHours}h ${duration.inMinutes.remainder(60)}m';
    } else {
      return '${duration.inMinutes}m ${duration.inSeconds.remainder(60)}s';
    }
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
                ('time_left', 'Ending Soon', Icons.timer),
                ('discount', 'Best Discount', Icons.local_offer),
                ('popularity', 'Most Popular', Icons.trending_up),
                ('price_low', 'Price: Low to High', Icons.arrow_upward),
                ('price_high', 'Price: High to Low', Icons.arrow_downward),
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

  void _showFlashSaleInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Flash Sale Info',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Flash Sale Rules:',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '• Limited time offers with huge discounts\n• Limited stock available\n• Once time runs out, deal expires\n• First come, first served basis\n• No price matching during flash sales',
                style: TextStyle(color: AppTheme.textSecondary, height: 1.5),
              ),
              SizedBox(height: 16),
              Text(
                'Tips:',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '• Act fast - items sell out quickly\n• Add to cart immediately to reserve\n• Check back regularly for new deals',
                style: TextStyle(color: AppTheme.textSecondary, height: 1.5),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  String _getSortLabel(String sortBy) {
    switch (sortBy) {
      case 'price_low': return 'Price ↑';
      case 'price_high': return 'Price ↓';
      case 'discount': return 'Best Discount';
      case 'popularity': return 'Popular';
      default: return 'Ending Soon';
    }
  }
}
