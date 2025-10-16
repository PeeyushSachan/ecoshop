import 'package:ecoshop/models/ui/variant_option_model.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/product/product_model.dart';
import '../../models/cart/cart_model.dart';
import '../../models/product/product_variant_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _couponController = TextEditingController();
  String? _appliedCoupon;
  double _couponDiscount = 0;

  // Sample cart items
  List<CartModelData> cartItems = [
    CartModelData(
      product: ProductModel(
        id: 101,
        name: "iPhone 15 Pro Max",
        description: "Latest flagship smartphone",
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
        // ID ko manually add karein
        id: "101",
        name: color,
      ))
      .toList(),
),
ProductVariantModel(
  type: "storage",
  options: ["256GB"]
      .map((storage) => VariantOptionModel(
        // Yahan bhi ID add karein
        id: "101", 
        name: storage,
      ))
      .toList(),
),
        ],
        inStock: true,
        brand: "Apple",
      ),
      quantity: 1,
      selectedVariants: {"color": "Natural Titanium", "storage": "256GB"},
    ),
    CartModelData(
      product: ProductModel(
        id: 102,
        name: "Nike Air Max 270",
        description: "Comfortable running shoes",
        images: ["https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400"],
        price: 8999,
        mrp: 12999,
        rating: 4.6,
        reviews: 892,
        categoryId: 2,
        variants: [
          ProductVariantModel(
            type: "size",
            options: ["9"].map((size) => VariantOptionModel(id: "102", name: size)).toList(),
          ),
          ProductVariantModel(
            type: "color",
            options: ["Black"].map((color) => VariantOptionModel(id: "102", name: color)).toList(),
          )
        ],
        inStock: true,
        brand: "Nike",
      ),
      quantity: 2,
      selectedVariants: {"size": "9", "color": "Black"},
    ),
  ];

  double get subtotal {
    return cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  double get totalDiscount {
    double productDiscount = cartItems.fold(0, (sum, item) {
      double itemDiscount = (item.product.mrp - item.product.price) * item.quantity;
      return sum + itemDiscount;
    });
    return productDiscount + _couponDiscount;
  }

  double get deliveryFee {
    return subtotal > 499 ? 0 : 49; // Free delivery over ₹499
  }

  double get total {
    return subtotal - _couponDiscount + deliveryFee;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: cartItems.isEmpty ? _buildEmptyCart() : _buildCartContent(),
        ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Column(
      children: [
        // App Bar
        _buildAppBar(),
        
        // Empty State
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 80,
                  color: Colors.white.withOpacity(0.3),
                ),
                const SizedBox(height: 24),
                Text(
                  'Your cart is empty',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Add some products to get started',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  decoration: AppTheme.primaryButtonDecoration,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to home or product listing
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text(
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
          ),
        ),
      ],
    );
  }

  Widget _buildCartContent() {
    return Column(
      children: [
        // App Bar
        _buildAppBar(),
        
        // Cart Items
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cart Items List
                Column(
                  children: cartItems.map((item) => _buildCartItem(item)).toList(),
                ),
                const SizedBox(height: 24),
                
                // Coupon Section
                _buildCouponSection(),
                const SizedBox(height: 24),
                
                // Bill Details
                _buildBillDetails(),
                const SizedBox(height: 100), // Space for checkout button
              ],
            ),
          ),
        ),
        
        // Checkout Button
        _buildCheckoutButton(),
      ],
    );
  }

  Widget _buildAppBar() {
    return Container(
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
            'Shopping Cart',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          if (cartItems.isNotEmpty)
            Text(
              '${cartItems.length} items',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 14,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CartModelData item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    item.product.images.isNotEmpty 
                        ? item.product.images.first 
                        : 'https://via.placeholder.com/200',
                    fit: BoxFit.contain,
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
                      item.product.name,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.product.brand != null)
                      Text(
                        item.product.brand!,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    const SizedBox(height: 4),
                    
                    // Selected Variants
                    Wrap(
                      spacing: 4,
                      children: item.selectedVariants.entries.map((variant) {
                        return Text(
                          '${variant.key}: ${variant.value}',
                          style: const TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 8),
                    
                    // Price
                    Row(
                      children: [
                        Text(
                          item.product.formattedPrice,
                          style: const TextStyle(
                            color: AppTheme.textPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (item.product.discountPercentage > 0)
                          Text(
                            item.product.formattedMrp,
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Remove Button
              IconButton(
                onPressed: () => _removeItem(item),
                icon: const Icon(Icons.delete_outline, color: AppTheme.errorColor),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Quantity and Actions
          Row(
            children: [
              // Quantity Selector
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: item.quantity > 1 ? () => _updateQuantity(item, item.quantity - 1) : null,
                      icon: const Icon(Icons.remove, color: AppTheme.textSecondary),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        item.quantity.toString(),
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: item.quantity < 10 ? () => _updateQuantity(item, item.quantity + 1) : null,
                      icon: const Icon(Icons.add, color: AppTheme.textSecondary),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              
              // Save for Later
              TextButton.icon(
                onPressed: () => _saveForLater(item),
                icon: const Icon(Icons.bookmark_border, color: AppTheme.accentColor, size: 18),
                label: const Text(
                  'Save for later',
                  style: TextStyle(color: AppTheme.accentColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCouponSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Apply Coupon',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          
          if (_appliedCoupon != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.successColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.successColor.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: AppTheme.successColor, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    'Coupon "$_appliedCoupon" applied',
                    style: const TextStyle(
                      color: AppTheme.successColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '-₹${_couponDiscount.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: AppTheme.successColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _appliedCoupon = null;
                        _couponDiscount = 0;
                        _couponController.clear();
                      });
                    },
                    icon: const Icon(Icons.close, color: AppTheme.successColor, size: 18),
                  ),
                ],
              ),
            )
          else
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _couponController,
                    style: const TextStyle(color: AppTheme.textPrimary),
                    decoration: const InputDecoration(
                      hintText: 'Enter coupon code',
                      hintStyle: TextStyle(color: AppTheme.textMuted),
                      prefixIcon: Icon(Icons.local_offer_outlined, color: AppTheme.accentColor),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: _applyCoupon,
                  child: const Text('Apply'),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildBillDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bill Details',
            style: TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          _buildBillRow('Item Total', '₹${subtotal.toStringAsFixed(0)}'),
          if (totalDiscount > 0)
            _buildBillRow('Discount', '-₹${totalDiscount.toStringAsFixed(0)}', color: AppTheme.successColor),
          _buildBillRow(
            'Delivery Fee',
            deliveryFee == 0 ? 'FREE' : '₹${deliveryFee.toStringAsFixed(0)}',
            color: deliveryFee == 0 ? AppTheme.successColor : null,
          ),
          const Divider(color: AppTheme.textMuted),
          _buildBillRow(
            'Total Amount',
            '₹${total.toStringAsFixed(0)}',
            isTotal: true,
          ),
          
          if (deliveryFee == 0)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.successColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_shipping, color: AppTheme.successColor, size: 16),
                  const SizedBox(width: 8),
                  const Text(
                    'Yay! Free delivery on this order',
                    style: TextStyle(color: AppTheme.successColor, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBillRow(String label, String value, {Color? color, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color ?? (isTotal ? AppTheme.textPrimary : AppTheme.textSecondary),
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: color ?? (isTotal ? AppTheme.textPrimary : AppTheme.textSecondary),
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Amount',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '₹${total.toStringAsFixed(0)}',
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: AppTheme.primaryButtonDecoration,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to checkout
                      _proceedToCheckout();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text(
                      'Proceed to Checkout',
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
          ],
        ),
      ),
    );
  }

  void _updateQuantity(CartModelData item, int newQuantity) {
    setState(() {
      item.quantity = newQuantity;
    });
  }

  void _removeItem(CartModelData item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text('Remove Item', style: TextStyle(color: AppTheme.textPrimary)),
        content: const Text(
          'Are you sure you want to remove this item from cart?',
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                cartItems.remove(item);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item removed from cart'),
                  backgroundColor: AppTheme.errorColor,
                ),
              );
            },
            child: const Text('Remove', style: TextStyle(color: AppTheme.errorColor)),
          ),
        ],
      ),
    );
  }

  void _saveForLater(CartModelData item) {
    setState(() {
      cartItems.remove(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Item saved for later'),
        backgroundColor: AppTheme.accentColor,
      ),
    );
  }

  void _applyCoupon() {
    String couponCode = _couponController.text.trim().toUpperCase();
    if (couponCode.isEmpty) return;

    // Mock coupon validation
    Map<String, double> validCoupons = {
      'SAVE10': subtotal * 0.1,
      'FIRST100': 100,
      'WELCOME50': 50,
    };

    if (validCoupons.containsKey(couponCode)) {
      setState(() {
        _appliedCoupon = couponCode;
        _couponDiscount = validCoupons[couponCode]!;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Coupon applied successfully!'),
          backgroundColor: AppTheme.successColor,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid coupon code'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    }
  }

  void _proceedToCheckout() {
    // Navigate to checkout screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Proceeding to checkout...'),
        backgroundColor: AppTheme.accentColor,
      ),
    );
  }
}

