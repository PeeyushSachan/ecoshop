import 'package:ecoshop/models/product_variant_model.dart';
import 'package:ecoshop/models/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_card.dart';
import '../theme/app_theme.dart';
import 'product_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> _allProducts = [];
  List<ProductModel> _searchResults = [];
  List<String> _recentSearches = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadSampleProducts();
  }

  void _loadSampleProducts() {
    // Sample product list - replace with your real data source
_allProducts = [
  ProductModel(
    id: 101,
    name: "iPhone 15 Pro Max",
    description: "Latest smartphone with Titanium design.",
    images: [
      "https://images.unsplash.com/photo-1592750475338-74b767bb014f?w=400"
    ],
    price: 89999,
    mrp: 99999,
    rating: 4.8,
    reviews: 1234,
    categoryId: 1,
    variants: [
      ProductVariantModel(
        type: "color",
        options: ["Natural Titanium", "Blue", "White", "Black"]
            .map((color) => VariantOptionModel(
                  id: color.toLowerCase().replaceAll(' ', '-'),
                  name: color,
                ))
            .toList(),
      ),
      ProductVariantModel(
        type: "storage",
        options: ["128GB", "256GB", "512GB"]
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
    description: "Comfortable running shoes.",
    images: [
      "https://images.unsplash.com/photo-1542291026-ec471d1a3f15?w=400"
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
  // Add more sample products as needed
];
  }

  void _performSearch(String query) {
    setState(() {
      _isSearching = true;
    });

    final lowerQuery = query.toLowerCase();

    final results = _allProducts.where((product) {
      return product.name.toLowerCase().contains(lowerQuery) ||
          (product.brand?.toLowerCase().contains(lowerQuery) ?? false);
    }).toList();

    setState(() {
      _searchResults = results;
      _isSearching = false;
      if(query.trim().isNotEmpty){
        _recentSearches.insert(0, query.trim());
        // Avoid duplicates and keep recent 5
        _recentSearches = _recentSearches.toSet().toList().sublist(0, _recentSearches.length > 5 ? 5 : _recentSearches.length);
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchResults = [];
      _isSearching = false;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = _searchController.text.isEmpty;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryDark,
        title: TextField(
          controller: _searchController,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Search products",
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            suffixIcon: _searchController.text.isNotEmpty
                ? GestureDetector(
                    onTap: _clearSearch,
                    child: const Icon(Icons.clear, color: Colors.white),
                  )
                : null,
            border: InputBorder.none,
          ),
          onSubmitted: (value) {
            if(value.trim().isNotEmpty){
              _performSearch(value.trim());
            }
          },
          onChanged: (value) {
            if(value.trim().isEmpty){
              setState(() {
                _searchResults = [];
              });
              return;
            }
            _performSearch(value.trim());
          },
        ),
      ),
      body: _isSearching
          ? const Center(child: CircularProgressIndicator())
          : isEmpty
              ? _buildRecentSearches()
              : _buildSearchResults(),
    );
  }

  Widget _buildRecentSearches() {
    if (_recentSearches.isEmpty) {
      return Center(
        child: Text(
          "No recent searches",
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          "Recent Searches",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
        ..._recentSearches.map((term) => ListTile(
              title: Text(
                term,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.close, color: Colors.white54),
                onPressed: () {
                  setState(() {
                    _recentSearches.remove(term);
                  });
                },
              ),
              onTap: () {
                _searchController.text = term;
                _performSearch(term);
              },
            )),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return Center(
        child: Text(
          "No products found",
          style: TextStyle(color: Colors.white.withOpacity(0.7)),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          final product = _searchResults[index];
          return ProductCard(
            product: product,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(productModel: product),
                ),
              );
            },
            onWishlistTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Added to wishlist'),
                  backgroundColor: Color(0xFF10B981),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
