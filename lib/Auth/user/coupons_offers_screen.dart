import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';

class CouponsOffersScreen extends StatefulWidget {
  const CouponsOffersScreen({Key? key}) : super(key: key);

  @override
  State<CouponsOffersScreen> createState() => _CouponsOffersScreenState();
}

class _CouponsOffersScreenState extends State<CouponsOffersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _couponCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _couponCodeController.dispose();
    super.dispose();
  }

  // Sample Coupons Data
  final List<CouponOffer> availableCoupons = [
    CouponOffer(
      id: "1",
      title: "FIRST50",
      description: "Get 50% off on your first order",
      discountType: "percentage",
      discountValue: 50,
      minOrderAmount: 999,
      maxDiscountAmount: 500,
      validUntil: DateTime.now().add(const Duration(days: 7)),
      category: "all",
      termsAndConditions: [
        "Valid only for new users",
        "Minimum order value ₹999",
        "Maximum discount ₹500",
        "Cannot be combined with other offers"
      ],
      isActive: true,
    ),
    CouponOffer(
      id: "2",
      title: "SAVE20",
      description: "Flat ₹200 off on orders above ₹1999",
      discountType: "fixed",
      discountValue: 200,
      minOrderAmount: 1999,
      maxDiscountAmount: 200,
      validUntil: DateTime.now().add(const Duration(days: 15)),
      category: "all",
      termsAndConditions: [
        "Valid on all products",
        "Minimum order value ₹1999",
        "One time use per user"
      ],
      isActive: true,
    ),
    CouponOffer(
      id: "3",
      title: "FASHION30",
      description: "30% off on Fashion items",
      discountType: "percentage",
      discountValue: 30,
      minOrderAmount: 1499,
      maxDiscountAmount: 1000,
      validUntil: DateTime.now().add(const Duration(days: 10)),
      category: "fashion",
      termsAndConditions: [
        "Valid only on Fashion category",
        "Minimum order value ₹1499",
        "Maximum discount ₹1000"
      ],
      isActive: true,
    ),
    CouponOffer(
      id: "4",
      title: "ELECTRONICS15",
      description: "15% off on Electronics",
      discountType: "percentage",
      discountValue: 15,
      minOrderAmount: 2999,
      maxDiscountAmount: 2000,
      validUntil: DateTime.now().add(const Duration(days: 20)),
      category: "electronics",
      termsAndConditions: [
        "Valid only on Electronics category",
        "Minimum order value ₹2999",
        "Maximum discount ₹2000"
      ],
      isActive: true,
    ),
  ];

  final List<CouponOffer> expiredCoupons = [
    CouponOffer(
      id: "5",
      title: "WELCOME25",
      description: "25% off on first purchase",
      discountType: "percentage",
      discountValue: 25,
      minOrderAmount: 799,
      maxDiscountAmount: 300,
      validUntil: DateTime.now().subtract(const Duration(days: 2)),
      category: "all",
      termsAndConditions: ["Expired offer"],
      isActive: false,
    ),
  ];

  final List<CouponOffer> usedCoupons = [
    CouponOffer(
      id: "6",
      title: "SAVE100",
      description: "₹100 off on orders above ₹999",
      discountType: "fixed",
      discountValue: 100,
      minOrderAmount: 999,
      maxDiscountAmount: 100,
      validUntil: DateTime.now().add(const Duration(days: 5)),
      category: "all",
      termsAndConditions: ["Already used by you"],
      isActive: false,
    ),
  ];

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
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        const Text(
                          'Coupons & Offers',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // Show coupon info
                            _showCouponInfoDialog();
                          },
                          icon: const Icon(Icons.info_outline, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Apply Coupon Code Section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Have a coupon code?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _couponCodeController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Enter coupon code',
                                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () => _applyCouponCode(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppTheme.accentColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                ),
                                child: const Text('Apply'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
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
                  labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  tabs: [
                    Tab(text: 'Available (${availableCoupons.length})'),
                    Tab(text: 'Used (${usedCoupons.length})'),
                    Tab(text: 'Expired (${expiredCoupons.length})'),
                  ],
                ),
              ),

              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildCouponsList(availableCoupons, 'available'),
                    _buildCouponsList(usedCoupons, 'used'),
                    _buildCouponsList(expiredCoupons, 'expired'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCouponsList(List<CouponOffer> coupons, String type) {
    if (coupons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getEmptyStateIcon(type),
              size: 80,
              color: Colors.white.withOpacity(0.3),
            ),
            const SizedBox(height: 16),
            Text(
              _getEmptyStateTitle(type),
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _getEmptyStateSubtitle(type),
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: coupons.length,
      itemBuilder: (context, index) {
        final coupon = coupons[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildCouponCard(coupon, type),
        );
      },
    );
  }

  Widget _buildCouponCard(CouponOffer coupon, String type) {
    final isExpired = type == 'expired';
    final isUsed = type == 'used';
    final isAvailable = type == 'available';

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isAvailable 
              ? AppTheme.accentColor.withOpacity(0.3)
              : AppTheme.textMuted.withOpacity(0.3),
        ),
        boxShadow: isAvailable ? [
          BoxShadow(
            color: AppTheme.accentColor.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ] : null,
      ),
      child: Column(
        children: [
          // Coupon Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isAvailable 
                  ? AppTheme.accentColor.withOpacity(0.1)
                  : AppTheme.textMuted.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                // Coupon Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isAvailable 
                        ? AppTheme.accentColor.withOpacity(0.2)
                        : AppTheme.textMuted.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(
                    _getCouponIcon(coupon.discountType),
                    color: isAvailable ? AppTheme.accentColor : AppTheme.textMuted,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                
                // Coupon Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            coupon.title,
                            style: TextStyle(
                              color: isAvailable ? AppTheme.textPrimary : AppTheme.textMuted,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (isExpired)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppTheme.errorColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'EXPIRED',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          else if (isUsed)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppTheme.textMuted,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'USED',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        coupon.description,
                        style: TextStyle(
                          color: isAvailable ? AppTheme.textSecondary : AppTheme.textMuted,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Copy Button
                if (isAvailable)
                  IconButton(
                    onPressed: () => _copyCouponCode(coupon.title),
                    icon: const Icon(Icons.copy, color: AppTheme.accentColor, size: 20),
                  ),
              ],
            ),
          ),

          // Coupon Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Discount Amount
                Row(
                  children: [
                    Icon(
                      Icons.local_offer,
                      color: isAvailable ? AppTheme.accentColor : AppTheme.textMuted,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _getDiscountText(coupon),
                      style: TextStyle(
                        color: isAvailable ? AppTheme.textPrimary : AppTheme.textMuted,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                
                // Minimum Order
                Row(
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: isAvailable ? AppTheme.textSecondary : AppTheme.textMuted,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Min. order ₹${coupon.minOrderAmount}',
                      style: TextStyle(
                        color: isAvailable ? AppTheme.textSecondary : AppTheme.textMuted,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.schedule,
                      color: isAvailable ? AppTheme.textSecondary : AppTheme.textMuted,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      isExpired 
                          ? 'Expired'
                          : 'Valid till ${_formatDate(coupon.validUntil)}',
                      style: TextStyle(
                        color: isExpired 
                            ? AppTheme.errorColor
                            : (isAvailable ? AppTheme.textSecondary : AppTheme.textMuted),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Action Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => _showTermsAndConditions(coupon),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: isAvailable ? AppTheme.accentColor : AppTheme.textMuted,
                          ),
                          foregroundColor: isAvailable ? AppTheme.accentColor : AppTheme.textMuted,
                        ),
                        child: const Text('Terms & Conditions'),
                      ),
                    ),
                    if (isAvailable) ...[
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _applyCoupon(coupon),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accentColor,
                          ),
                          child: const Text('Apply Coupon'),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getCouponIcon(String discountType) {
    switch (discountType) {
      case 'percentage':
        return Icons.percent;
      case 'fixed':
        return Icons.currency_rupee;
      default:
        return Icons.local_offer;
    }
  }

  String _getDiscountText(CouponOffer coupon) {
    if (coupon.discountType == 'percentage') {
      return '${coupon.discountValue}% off (up to ₹${coupon.maxDiscountAmount})';
    } else {
      return '₹${coupon.discountValue} off';
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  IconData _getEmptyStateIcon(String type) {
    switch (type) {
      case 'available':
        return Icons.local_offer;
      case 'used':
        return Icons.check_circle;
      case 'expired':
        return Icons.access_time;
      default:
        return Icons.local_offer;
    }
  }

  String _getEmptyStateTitle(String type) {
    switch (type) {
      case 'available':
        return 'No coupons available';
      case 'used':
        return 'No used coupons';
      case 'expired':
        return 'No expired coupons';
      default:
        return 'No coupons found';
    }
  }

  String _getEmptyStateSubtitle(String type) {
    switch (type) {
      case 'available':
        return 'Check back later for new offers and discounts';
      case 'used':
        return 'Coupons you\'ve used will appear here';
      case 'expired':
        return 'Your expired coupons will be shown here';
      default:
        return '';
    }
  }

  void _copyCouponCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Coupon code "$code" copied to clipboard'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _applyCouponCode() {
    final code = _couponCodeController.text.trim();
    if (code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a coupon code'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    // Find coupon in available coupons
    final coupon = availableCoupons.firstWhere(
      (c) => c.title.toLowerCase() == code.toLowerCase(),
      orElse: () => CouponOffer(
        id: '',
        title: '',
        description: '',
        discountType: '',
        discountValue: 0,
        minOrderAmount: 0,
        maxDiscountAmount: 0,
        validUntil: DateTime.now(),
        category: '',
        termsAndConditions: [],
        isActive: false,
      ),
    );

    if (coupon.id.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid coupon code'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    } else {
      _applyCoupon(coupon);
    }
  }

  void _applyCoupon(CouponOffer coupon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Coupon "${coupon.title}" applied successfully!'),
        backgroundColor: AppTheme.successColor,
        action: SnackBarAction(
          label: 'Shop Now',
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
    _couponCodeController.clear();
  }

  void _showTermsAndConditions(CouponOffer coupon) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: Text(
          'Terms & Conditions - ${coupon.title}',
          style: const TextStyle(color: AppTheme.textPrimary),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: coupon.termsAndConditions.map((term) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        term,
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showCouponInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'How to use coupons?',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '1. Browse available coupons below',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '2. Copy the coupon code you want to use',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '3. Apply it during checkout to get discount',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '4. Check terms & conditions for each coupon',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                'Note: Only one coupon can be used per order',
                style: TextStyle(
                  color: AppTheme.accentColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
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
}

// Coupon Offer Model
class CouponOffer {
  final String id;
  final String title;
  final String description;
  final String discountType; // 'percentage' or 'fixed'
  final double discountValue;
  final double minOrderAmount;
  final double maxDiscountAmount;
  final DateTime validUntil;
  final String category;
  final List<String> termsAndConditions;
  final bool isActive;

  CouponOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.discountType,
    required this.discountValue,
    required this.minOrderAmount,
    required this.maxDiscountAmount,
    required this.validUntil,
    required this.category,
    required this.termsAndConditions,
    required this.isActive,
  });
}