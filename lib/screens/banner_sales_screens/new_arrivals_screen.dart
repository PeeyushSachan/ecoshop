import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';
import '../../widgets/product_card.dart';
import '../product_detail_screen.dart';

class NewArrivalsScreen extends StatefulWidget {
  const NewArrivalsScreen({Key? key}) : super(key: key);

  @override
  State<NewArrivalsScreen> createState() => _NewArrivalsScreenState();
}

class _NewArrivalsScreenState extends State<NewArrivalsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isGridView = true;
  String _sortBy = 'newest';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

// Sample New Arrival Products
final List<ProductModel> menFashion = [
  ProductModel(
    id: 2001,
    name: "Premium Cotton Polo Shirt",
    description: "Classic fit polo shirt in premium cotton blend",
    images: ["https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400"],
    price: 1299,
    mrp: 1999,
    rating: 4.5,
    reviews: 234,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["S", "M", "L", "XL", "XXL"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Navy", "White", "Black", "Grey"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Fashion Hub",
  ),
  ProductModel(
    id: 2002,
    name: "Slim Fit Denim Jeans",
    description: "Modern slim fit jeans with stretch comfort",
    images: ["https://images.unsplash.com/photo-1542272604-787c3835535d?w=400"],
    price: 2499,
    mrp: 3999,
    rating: 4.3,
    reviews: 456,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["28", "30", "32", "34", "36"]
            .map((e) => VariantOptionModel(id: e, name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Dark Blue", "Light Blue", "Black"]
            .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Denim Co",
  ),
];

final List<ProductModel> womenFashion = [
  ProductModel(
    id: 2003,
    name: "Floral Print Maxi Dress",
    description: "Elegant floral print dress for special occasions",
    images: ["https://images.unsplash.com/photo-1515372039744-b8f02a3ae446?w=400"],
    price: 1899,
    mrp: 2999,
    rating: 4.6,
    reviews: 789,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["XS", "S", "M", "L", "XL"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Pink Floral", "Blue Floral", "White Floral"]
            .map((e) => VariantOptionModel(id: e.toLowerCase().replaceAll(' ', '-'), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Elegant Wear",
  ),
  ProductModel(
    id: 2004,
    name: "Designer Handbag",
    description: "Premium leather handbag with elegant design",
    images: ["https://images.unsplash.com/photo-1584917865442-de89df76afd3?w=400"],
    price: 3499,
    mrp: 4999,
    rating: 4.8,
    reviews: 345,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Black", "Brown", "Tan", "Red"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Luxury Bags",
  ),
];

final List<ProductModel> kidsFashion = [
  ProductModel(
    id: 2005,
    name: "Kids Cotton T-Shirt Set",
    description: "Comfortable cotton t-shirts for active kids",
    images: ["https://images.unsplash.com/photo-1503944583220-79d8926ad5e2?w=400"],
    price: 799,
    mrp: 1299,
    rating: 4.4,
    reviews: 567,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["2-3Y", "4-5Y", "6-7Y", "8-9Y"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Blue", "Red", "Green", "Yellow"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Kids Fashion",
  ),
];

final List<ProductModel> accessories = [
  ProductModel(
    id: 2006,
    name: "Leather Watch",
    description: "Classic analog watch with leather strap",
    images: ["https://images.unsplash.com/photo-1524592094714-0f0654e20314?w=400"],
    price: 2999,
    mrp: 4999,
    rating: 4.7,
    reviews: 234,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Black", "Brown", "Navy"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "TimeKeeper",
  ),
  ProductModel(
    id: 2007,
    name: "Sunglasses Collection",
    description: "Trendy sunglasses with UV protection",
    images: ["https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400"],
    price: 1499,
    mrp: 2499,
    rating: 4.2,
    reviews: 178,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "style",
        options: ["Aviator", "Wayfarer", "Round"]
            .map((e) => VariantOptionModel(id: e.toLowerCase(), name: e))
            .toList(),
      )
    ],
    inStock: true,
    brand: "SunStyle",
  ),
];

  List<ProductModel> get _currentProducts {
    switch (_tabController.index) {
      case 0: return [...menFashion, ...womenFashion, ...kidsFashion, ...accessories];
      case 1: return menFashion;
      case 2: return womenFashion;
      case 3: return kidsFashion;
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
      case 'newest':
        products.sort((a, b) => b.id.compareTo(a.id));
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
                        'New Arrivals',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Search in new arrivals
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Search functionality')),
                        );
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Fresh Fashion Header
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple[400]!, Colors.pink[400]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.style,
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
                              'FRESH FASHION',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Latest Trends & Styles',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
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
                          'NEW',
                          style: TextStyle(
                            color: Colors.purple[600],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
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
                    Tab(text: 'Men (${menFashion.length})'),
                    Tab(text: 'Women (${womenFashion.length})'),
                    Tab(text: 'Kids (${kidsFashion.length})'),
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
                  children: List.generate(4, (index) {
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
              Icons.style,
              size: 80,
              color: AppTheme.textMuted,
            ),
            SizedBox(height: 16),
            Text(
              'No new arrivals in this category',
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
            // New Badge
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.purple[400]!, Colors.pink[400]!],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(
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
    
    if (products.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.style,
              size: 80,
              color: AppTheme.textMuted,
            ),
            SizedBox(height: 16),
            Text(
              'No new arrivals in this category',
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
                Positioned(
                  top: 4,
                  left: 4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.purple[400]!, Colors.pink[400]!],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'NEW',
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
                ('newest', 'Newest First', Icons.new_releases),
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
      default: return 'Newest';
    }
  }
}