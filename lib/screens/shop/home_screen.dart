import 'package:ecoshop/models/promotional/app_banner_Model.dart';
import 'package:ecoshop/models/product/product_variant_model.dart';
import 'package:ecoshop/models/ui/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'cart_screen.dart';
import 'category_detail_screen.dart';
import 'search_screen.dart';
import 'product_detail_screen.dart';
import '../../models/product/product_model.dart';
import '../../data/category_data.dart' ;
import '../../widgets/cards/product_card.dart';
import 'product_detail_screen.dart';
import 'view_all_product_screen.dart';

import 'package:ecoshop/widgets/cards/banner_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;

  // Sample Data - Replace with API calls
  final List<AppBannerModel> banners = [
    AppBannerModel(
      id: 1,
      title: "Mega Sale",
      subtitle: "Up to 70% OFF",
      image: "https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?w=800",
      link: "/mega-sale",
      buttonText: "Shop Now",
    ),
    AppBannerModel(
      id: 2,
      title: "New Arrivals",
      subtitle: "Fresh Fashion",
      image: "https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800",
      link: "/new-arrivals",
      buttonText: "Explore",
    ),
    AppBannerModel(
      id: 3,
      title: "Electronics Fest",
      subtitle: "Latest Gadgets",
      image: "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?w=800",
      link: "/electronics-fest",
      buttonText: "Discover",
    ),
  ];

  // Categories
  final List<CategoryData> categories = [
    CategoryData(id: 1, name: "Electronics", icon: "📱", color: "#10B981"),
    CategoryData(id: 2, name: "Fashion", icon: "👕", color: "#8B5CF6"),
    CategoryData(id: 3, name: "Home & Garden", icon: "🏠", color: "#F59E0B"),
    CategoryData(id: 4, name: "Sports & Fitness", icon: "⚽", color: "#EF4444"),
    CategoryData(id: 5, name: "Beauty & Care", icon: "💄", color: "#EC4899"),
    CategoryData(id: 6, name: "Books & Media", icon: "📚", color: "#3B82F6"),
  ];

final List<ProductModel> featuredProducts = [
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
    name: "MacBook Air M2",
    description: "Lightweight laptop with M2 chip and all-day battery life",
    images: [
      "https://images.unsplash.com/photo-1541807084-5c52b6b3adef?w=400",
      "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400"
    ],
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
      ),
    ],
    inStock: true,
    brand: "Apple",
  ),
  ProductModel(
    id: 104,
    name: "Samsung Galaxy S24",
    description: "Flagship Android smartphone with AI features",
    images: ["https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=400"],
    price: 79999,
    mrp: 89999,
    rating: 4.6,
    reviews: 890,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Black", "White", "Purple"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase(),
                  name: color,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["256GB", "512GB"]
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

  @override
  void initState() {
    super.initState();
    _startBannerAutoSlide();
  }

  void _startBannerAutoSlide() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        int nextPage = (_currentBannerIndex + 1) % banners.length;
        _bannerController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        _startBannerAutoSlide();
      }
    });
  }

  Color _getCategoryColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return AppTheme.accentColor; // Default fallback
    }
  }

  @override
  void dispose() {
    _bannerController.dispose();
    super.dispose();
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
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                  ),
                ),
                title: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'EcoShop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                actions: [
                  // Search Button
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/notifications');
                    },
                    icon: const Icon(Icons.notifications_outlined, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const CartScreen())
                      );
                    },
                    icon: Stack(
                      children: [
                        const Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: AppTheme.errorColor,
                              shape: BoxShape.circle,
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: const Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Banner Section
              SliverToBoxAdapter(
                child: Container(
                  height: 180,
                  margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: PageView.builder(
                    controller: _bannerController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentBannerIndex = index;
                      });
                    },
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      return AppBannerCard(
                        banner: banners[index],
                        onTap: () {
                          Navigator.pushNamed(context, banners[index].link);
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   SnackBar(content: Text('Clicked: ${banners[index].title}')),
                          // );
                        },
                      );
                    },
                  ),
                ),
              ),

              // Banner Indicators
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: banners.map((banner) {
                    int index = banners.indexOf(banner);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentBannerIndex == index
                            ? AppTheme.accentColor
                            : Colors.white.withOpacity(0.3),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Categories Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Shop by Category',
                            style: TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                   
                  Navigator.pushNamed(context, '/categories');
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                color: AppTheme.accentColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          final categoryColor = _getCategoryColor(category.color);
                          
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoryDetailScreen(
                                    category: category,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: categoryColor.withOpacity(0.3),
                                  width: 1.5,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    categoryColor.withOpacity(0.08),
                                    categoryColor.withOpacity(0.02),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: categoryColor.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        category.icon,
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    category.name,
                                    style: const TextStyle(
                                      color: AppTheme.textPrimary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Featured Products Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Featured Products',
                            style: TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewAllProductsScreen()
                                  ,
                                ),

                              );
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                color: AppTheme.accentColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: featuredProducts.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 200,
                              margin: EdgeInsets.only(
                                right: index < featuredProducts.length - 1 ? 16 : 0,
                              ),
                              child: ProductCard(
                                product: featuredProducts[index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                        productModel: featuredProducts[index],
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
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Deals Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Today\'s Deals',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: AppTheme.accentGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Flash Sale',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Up to 80% OFF',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/flash-sale');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: AppTheme.accentColor,
                                    ),
                                    child: const Text('Shop Now'),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              Icons.flash_on,
                              color: Colors.white,
                              size: 48,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
}



