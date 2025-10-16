import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';

class ProductListingScreen extends StatefulWidget {
  final int? categoryId;
  final String? searchQuery;

  const ProductListingScreen({
    Key? key,
    this.categoryId,
    this.searchQuery,
  }) : super(key: key);

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  final ScrollController _scrollController = ScrollController();
  String _sortBy = 'popular';
  double _minPrice = 0;
  double _maxPrice = 100000;
  List<String> _selectedBrands = [];
  double _minRating = 0;
  bool _isFilterVisible = false;

  // Sample products data
 final List<ProductModel> allProducts = [
  ProductModel(
    id: 101,
    name: "iPhone 15 Pro Max",
    description: "Latest flagship smartphone with titanium design and advanced camera system",
    images: [
      "https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400",
      "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400"
    ],
    price: 89999,
    mrp: 99999,
    rating: 4.8,
    reviews: 1234,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Natural Titanium", "Blue Titanium"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase().replaceAll(' ', '-'),
                  name: color,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["128GB", "256GB", "512GB", "1TB"]
            .map((storage) => VariantOptionModel(
                  id: storage.toLowerCase(),
                  name: storage,
                ))
            .toList(),
      ),
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 102,
    name: "Nike Air Max 270",
    description: "Comfortable running shoes with Max Air cushioning",
    images: [
      "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400",
      "https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?w=400"
    ],
    price: 8999,
    mrp: 12999,
    rating: 4.6,
    reviews: 892,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["7", "8", "9", "10", "11"]
            .map((size) => VariantOptionModel(id: size, name: size))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Black", "White", "Navy", "Red"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      ),
    ],
    inStock: true,
    brand: "Nike",
  ),
  ProductModel(
    id: 103,
    name: "Sony WH-1000XM5",
    description: "Premium noise-canceling wireless headphones",
    images: [
      "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400",
      "https://images.unsplash.com/photo-1484704849700-f032a568e944?w=400"
    ],
    price: 24990,
    mrp: 29990,
    rating: 4.7,
    reviews: 456,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Black", "Silver"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Sony",
  ),
  ProductModel(
    id: 104,
    name: "Adidas Ultraboost 22",
    description: "Revolutionary running shoes with boost technology",
    images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
    price: 12999,
    mrp: 16999,
    rating: 4.5,
    reviews: 678,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["7", "8", "9", "10", "11"]
            .map((size) => VariantOptionModel(id: size, name: size))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Black", "White", "Blue"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      ),
    ],
    inStock: true,
    brand: "Adidas",
  ),
  ProductModel(
    id: 105,
    name: "Samsung Galaxy S24 Ultra",
    description: "Flagship Android smartphone with S Pen and AI features",
    images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
    price: 79999,
    mrp: 89999,
    rating: 4.6,
    reviews: 890,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Titanium Black", "Titanium Gray"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase().replaceAll(' ', '-'),
                  name: color,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["256GB", "512GB", "1TB"]
            .map((storage) => VariantOptionModel(
                  id: storage.toLowerCase(),
                  name: storage,
                ))
            .toList(),
      ),
    ],
    inStock: true,
    brand: "Samsung",
  ),
];

  List<String> get availableBrands {
    return allProducts.map((p) => p.brand ?? '').where((b) => b.isNotEmpty).toSet().toList();
  }

  List<ProductModel> get filteredProducts {
    List<ProductModel> filtered = List.from(allProducts);

    // Filter by category
    if (widget.categoryId != null) {
      filtered = filtered.where((p) => p.categoryId == widget.categoryId).toList();
    }

    // Filter by search query
    if (widget.searchQuery != null && widget.searchQuery!.isNotEmpty) {
      filtered = filtered.where((p) => 
        p.name.toLowerCase().contains(widget.searchQuery!.toLowerCase()) ||
        (p.brand?.toLowerCase().contains(widget.searchQuery!.toLowerCase()) ?? false)
      ).toList();
    }

    // Filter by price range
    filtered = filtered.where((p) => p.price >= _minPrice && p.price <= _maxPrice).toList();

    // Filter by brands
    if (_selectedBrands.isNotEmpty) {
      filtered = filtered.where((p) => _selectedBrands.contains(p.brand)).toList();
    }

    // Filter by rating
    filtered = filtered.where((p) => p.rating >= _minRating).toList();

    // Sort products
    switch (_sortBy) {
      case 'price_low':
        filtered.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high':
        filtered.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'rating':
        filtered.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'newest':
        filtered.sort((a, b) => b.id.compareTo(a.id));
        break;
      default: // popular
        filtered.sort((a, b) => b.reviews.compareTo(a.reviews));
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    final products = filteredProducts;

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
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        Expanded(
                          child: Text(
                            widget.searchQuery != null 
                                ? 'Search Results'
                                : widget.categoryId != null 
                                    ? 'Category Products'
                                    : 'All Products',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    
                    // Sort and Filter Row
                    Row(
                      children: [
                        Expanded(
                          child: _buildSortButton(),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildFilterButton(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Products Grid
              Expanded(
                child: products.isEmpty
                    ? _buildEmptyState()
                    : GridView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return ProductCard(
                            product: products[index],
                            onTap: () {
                              // Navigate to product detail
                            },
                            onWishlistTap: () {
                              // Add to wishlist
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      
      // Filter Bottom Sheet
      bottomSheet: _isFilterVisible ? _buildFilterBottomSheet() : null,
    );
  }

  Widget _buildSortButton() {
    return GestureDetector(
      onTap: () => _showSortBottomSheet(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sort, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(
              _getSortLabel(_sortBy),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFilterVisible = !_isFilterVisible;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.filter_list, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            const Text(
              'Filter',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 80,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No products found',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your filters',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: AppTheme.backgroundDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _minPrice = 0;
                      _maxPrice = 100000;
                      _selectedBrands.clear();
                      _minRating = 0;
                    });
                  },
                  child: const Text(
                    'Clear All',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isFilterVisible = false;
                    });
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),
          
          // Filter Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price Range
                  _buildFilterSection(
                    'Price Range',
                    Column(
                      children: [
                        RangeSlider(
                          values: RangeValues(_minPrice, _maxPrice),
                          min: 0,
                          max: 100000,
                          divisions: 20,
                          activeColor: AppTheme.accentColor,
                          inactiveColor: AppTheme.accentColor.withOpacity(0.3),
                          onChanged: (values) {
                            setState(() {
                              _minPrice = values.start;
                              _maxPrice = values.end;
                            });
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹${_minPrice.toInt()}',
                              style: const TextStyle(color: AppTheme.textSecondary),
                            ),
                            Text(
                              '₹${_maxPrice.toInt()}',
                              style: const TextStyle(color: AppTheme.textSecondary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  // Brands
                  _buildFilterSection(
                    'Brands',
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: availableBrands.map((brand) {
                        bool isSelected = _selectedBrands.contains(brand);
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _selectedBrands.remove(brand);
                              } else {
                                _selectedBrands.add(brand);
                              }
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: isSelected ? AppTheme.accentColor : AppTheme.surfaceColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              brand,
                              style: TextStyle(
                                color: isSelected ? Colors.white : AppTheme.textSecondary,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  
                  // Rating
                  _buildFilterSection(
                    'Minimum Rating',
                    Column(
                      children: [
                        Slider(
                          value: _minRating,
                          min: 0,
                          max: 5,
                          divisions: 50,
                          activeColor: AppTheme.accentColor,
                          inactiveColor: AppTheme.accentColor.withOpacity(0.3),
                          onChanged: (value) {
                            setState(() {
                              _minRating = value;
                            });
                          },
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star, color: AppTheme.successColor, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              _minRating.toStringAsFixed(1),
                              style: const TextStyle(color: AppTheme.textSecondary),
                            ),
                            const Text(
                              ' & above',
                              style: TextStyle(color: AppTheme.textSecondary),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Apply Button
          Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isFilterVisible = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.accentColor,
                ),
                child: const Text(
                  'Apply Filters',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(String title, Widget content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          content,
        ],
      ),
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