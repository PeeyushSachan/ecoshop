import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class ViewAllProductsScreen extends StatefulWidget {
  const ViewAllProductsScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllProductsScreen> createState() => _ViewAllProductsScreenState();
}

class _ViewAllProductsScreenState extends State<ViewAllProductsScreen> {
  String _sortBy = 'popular';
  bool _isGridView = true;
  String _selectedCategory = 'All';
  List<ProductModel> _filteredProducts = [];

  // All Products Data

  final List<ProductModel> allProducts = [
  // Electronics
  ProductModel(
    id: 101,
    name: "iPhone 15 Pro Max22",
    description: "Latest flagship smartphone with titanium design and advanced camera system",
    images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
    price: 89999,
    mrp: 99999,
    rating: 4.8,
    reviews: 1234,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Natural Titanium", "Blue Titanium", "White Titanium", "Black Titanium"]
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
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 102,
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
        options: ["Titanium Black", "Titanium Gray", "Titanium Violet"]
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
      )
    ],
    inStock: true,
    brand: "Samsung",
  ),
  ProductModel(
    id: 103,
    name: "MacBook Air M2",
    description: "Lightweight laptop with M2 chip and all-day battery life",
    images: ["https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400"],
    price: 94999,
    mrp: 104999,
    rating: 4.9,
    reviews: 567,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Space Gray", "Silver", "Gold", "Starlight"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase().replaceAll(' ', '-'),
                  name: color,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "memory",
        options: ["8GB", "16GB", "24GB"]
            .map((memory) => VariantOptionModel(
                  id: memory.toLowerCase(),
                  name: memory,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["256GB", "512GB", "1TB", "2TB"]
            .map((storage) => VariantOptionModel(
                  id: storage.toLowerCase(),
                  name: storage,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 104,
    name: "iPad Pro 12.9-inch",
    description: "Most advanced iPad with M2 chip and Liquid Retina XDR display",
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
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase().replaceAll(' ', '-'),
                  name: color,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["128GB", "256GB", "512GB", "1TB", "2TB"]
            .map((storage) => VariantOptionModel(
                  id: storage.toLowerCase(),
                  name: storage,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 105,
    name: "Sony WH-1000XM5",
    description: "Premium noise-canceling wireless headphones",
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

  // Fashion
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
      ProductVariantModel(
        type: "size",
        options: ["7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11"]
            .map((size) => VariantOptionModel(id: size, name: size))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Black", "White", "Navy", "Red", "Blue"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Nike",
  ),
  ProductModel(
    id: 202,
    name: "Adidas Ultraboost 22",
    description: "Revolutionary running shoes with responsive BOOST cushioning",
    images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
    price: 12999,
    mrp: 16999,
    rating: 4.5,
    reviews: 678,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["7", "8", "9", "10", "11", "12"]
            .map((size) => VariantOptionModel(id: size, name: size))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Black", "White", "Blue", "Red", "Gray"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Adidas",
  ),
  ProductModel(
    id: 203,
    name: "Levi's 501 Original Jeans",
    description: "Classic straight-leg jeans with authentic vintage fit",
    images: ["https://images.unsplash.com/photo-1542272604-787c3835535d?w=400"],
    price: 3999,
    mrp: 5999,
    rating: 4.4,
    reviews: 2134,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["28", "30", "32", "34", "36", "38"]
            .map((size) => VariantOptionModel(id: size, name: size))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Dark Blue", "Light Blue", "Black", "Gray"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase().replaceAll(' ', '-'),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Levi's",
  ),
  ProductModel(
    id: 204,
    name: "Zara Cotton T-Shirt",
    description: "Premium cotton t-shirt with modern fit",
    images: ["https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=400"],
    price: 1299,
    mrp: 1999,
    rating: 4.2,
    reviews: 456,
    categoryId: 2,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["XS", "S", "M", "L", "XL", "XXL"]
            .map((size) => VariantOptionModel(id: size.toLowerCase(), name: size))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Black", "White", "Navy", "Gray", "Red"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Zara",
  ),

  // Home & Garden
  ProductModel(
    id: 301,
    name: "IKEA Malm Bed Frame",
    description: "Modern wooden bed frame with clean lines",
    images: ["https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=400"],
    price: 12999,
    mrp: 15999,
    rating: 4.3,
    reviews: 234,
    categoryId: 3,
    variants: [
      ProductVariantModel(
        type: "size",
        options: ["Single", "Double", "Queen", "King"]
            .map((size) => VariantOptionModel(id: size.toLowerCase(), name: size))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["White", "Oak", "Black-Brown"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase().replaceAll(' ', '-'),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "IKEA",
  ),
  ProductModel(
    id: 302,
    name: "Philips Air Purifier",
    description: "Advanced air purification with HEPA filter",
    images: ["https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400"],
    price: 8999,
    mrp: 11999,
    rating: 4.6,
    reviews: 156,
    categoryId: 3,
    variants: [
      ProductVariantModel(
        type: "coverage",
        options: ["Small Room", "Medium Room", "Large Room"]
            .map((coverage) => VariantOptionModel(
                  id: coverage.toLowerCase().replaceAll(' ', '-'),
                  name: coverage,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["White", "Black"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Philips",
  ),

  // Sports & Fitness
  ProductModel(
    id: 401,
    name: "Yoga Mat Premium",
    description: "Non-slip yoga mat with superior grip",
    images: ["https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=400"],
    price: 1999,
    mrp: 2999,
    rating: 4.5,
    reviews: 345,
    categoryId: 4,
    variants: [
      ProductVariantModel(
        type: "thickness",
        options: ["4mm", "6mm", "8mm"]
            .map((thickness) => VariantOptionModel(
                  id: thickness.toLowerCase(),
                  name: thickness,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "color",
        options: ["Purple", "Blue", "Green", "Pink"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "FitnessPro",
  ),

  // Beauty & Care
  ProductModel(
    id: 501,
    name: "Lakme Absolute Lipstick",
    description: "Long-lasting matte lipstick with rich color",
    images: ["https://images.unsplash.com/photo-1586495777744-4413f21062fa?w=400"],
    price: 799,
    mrp: 999,
    rating: 4.3,
    reviews: 567,
    categoryId: 5,
    variants: [
      ProductVariantModel(
        type: "shade",
        options: ["Red Envy", "Pink Crush", "Coral Blush"]
            .map((shade) => VariantOptionModel(
                  id: shade.toLowerCase().replaceAll(' ', '-'),
                  name: shade,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "Lakme",
  ),

  // Books & Media
  ProductModel(
    id: 601,
    name: "The Alchemist",
    description: "International bestseller by Paulo Coelho",
    images: ["https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400"],
    price: 299,
    mrp: 399,
    rating: 4.8,
    reviews: 1567,
    categoryId: 6,
    variants: [
      ProductVariantModel(
        type: "format",
        options: ["Paperback", "Hardcover", "eBook"]
            .map((format) => VariantOptionModel(
                  id: format.toLowerCase(),
                  name: format,
                ))
            .toList(),
      )
    ],
    inStock: true,
    brand: "HarperCollins",
  ),
];

  // Categories for filter
  final List<String> categories = [
    'All',
    'Electronics',
    'Fashion', 
    'Home & Garden',
    'Sports & Fitness',
    'Beauty & Care',
    'Books & Media'
  ];

  @override
  void initState() {
    super.initState();
    _filteredProducts = allProducts;
  }

  void _applyFilters() {
    setState(() {
      // Filter by category
      if (_selectedCategory == 'All') {
        _filteredProducts = allProducts;
      } else {
        int categoryId = categories.indexOf(_selectedCategory);
        _filteredProducts = allProducts.where((product) => 
          product.categoryId == categoryId
        ).toList();
      }

      // Sort products
      switch (_sortBy) {
        case 'price_low':
          _filteredProducts.sort((a, b) => a.price.compareTo(b.price));
          break;
        case 'price_high':
          _filteredProducts.sort((a, b) => b.price.compareTo(a.price));
          break;
        case 'rating':
          _filteredProducts.sort((a, b) => b.rating.compareTo(a.rating));
          break;
        case 'newest':
          _filteredProducts.sort((a, b) => b.id.compareTo(a.id));
          break;
        default: // popular
          _filteredProducts.sort((a, b) => b.reviews.compareTo(a.reviews));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // App Bar
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: Colors.transparent,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                  ),
                ),
                title: const Text(
                  'All Products',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      // Search functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Search functionality')),
                      );
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),

              // Filter and Sort Bar
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Category Filter
                      Container(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            final isSelected = _selectedCategory == category;
                            
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedCategory = category;
                                });
                                _applyFilters();
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: isSelected ? AppTheme.accentColor : AppTheme.surfaceColor,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: isSelected ? AppTheme.accentColor : AppTheme.accentColor.withOpacity(0.3),
                                  ),
                                ),
                                child: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : AppTheme.textSecondary,
                                    fontSize: 14,
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      // Sort and View Toggle
                      Row(
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Products Count
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    '${_filteredProducts.length} products found',
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              // Products Grid/List
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: _isGridView ? _buildProductsGrid() : _buildProductsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsGrid() {
    if (_filteredProducts.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
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
                ),
              ),
            ],
          ),
        ),
      );
    }

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
            product: _filteredProducts[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    productModel: _filteredProducts[index],
                  ),
                ),
              );
            },
            onWishlistTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${_filteredProducts[index].name} added to wishlist'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
          );
        },
        childCount: _filteredProducts.length,
      ),
    );
  }

  Widget _buildProductsList() {
    if (_filteredProducts.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
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
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final product = _filteredProducts[index];
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
                      if (product.brand != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          product.brand!,
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
                    ],
                  ),
                ),
                
                // Actions
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to wishlist'),
                            backgroundColor: AppTheme.successColor,
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite_border, color: AppTheme.textMuted),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(productModel: product),
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
        childCount: _filteredProducts.length,
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
                ('popular', 'Popularity', Icons.trending_up),
                ('price_low', 'Price: Low to High', Icons.arrow_upward),
                ('price_high', 'Price: High to Low', Icons.arrow_downward),
                ('rating', 'Customer Rating', Icons.star),
                ('newest', 'Newest First', Icons.new_releases),
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
                    _applyFilters();
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