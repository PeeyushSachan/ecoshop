import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';

class GiftCardScreen extends StatefulWidget {
  const GiftCardScreen({Key? key}) : super(key: key);

  @override
  State<GiftCardScreen> createState() => _GiftCardScreenState();
}

class _GiftCardScreenState extends State<GiftCardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _giftCardCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _giftCardCodeController.dispose();
    super.dispose();
  }

  // Sample Gift Cards Data
  final List<GiftCard> availableGiftCards = [
    GiftCard(
      id: "1",
      brand: "Amazon",
      value: 500,
      description: "Perfect for shopping electronics, books, and more",
      image: "https://images.unsplash.com/photo-1523474253046-8cd2748b5fd2?w=400",
      validityDays: 365,
      category: "Shopping",
      isActive: true,
      purchaseDate: DateTime.now(),
      expiryDate: DateTime.now().add(const Duration(days: 365)),
    ),
    GiftCard(
      id: "2",
      brand: "Flipkart",
      value: 1000,
      description: "India's largest e-commerce platform gift card",
      image: "https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=400",
      validityDays: 365,
      category: "Shopping",
      isActive: true,
      purchaseDate: DateTime.now(),
      expiryDate: DateTime.now().add(const Duration(days: 365)),
    ),
    GiftCard(
      id: "3",
      brand: "Starbucks",
      value: 300,
      description: "Enjoy your favorite coffee and beverages",
      image: "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400",
      validityDays: 180,
      category: "Food & Beverage",
      isActive: true,
      purchaseDate: DateTime.now(),
      expiryDate: DateTime.now().add(const Duration(days: 180)),
    ),
    GiftCard(
      id: "4",
      brand: "Netflix",
      value: 649,
      description: "Stream unlimited movies and TV shows",
      image: "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?w=400",
      validityDays: 30,
      category: "Entertainment",
      isActive: true,
      purchaseDate: DateTime.now(),
      expiryDate: DateTime.now().add(const Duration(days: 30)),
    ),
    GiftCard(
      id: "5",
      brand: "Zomato",
      value: 500,
      description: "Order delicious food from your favorite restaurants",
      image: "https://images.unsplash.com/photo-1565299624946-b28f40a0ca4b?w=400",
      validityDays: 180,
      category: "Food & Beverage",
      isActive: true,
      purchaseDate: DateTime.now(),
      expiryDate: DateTime.now().add(const Duration(days: 180)),
    ),
    GiftCard(
      id: "6",
      brand: "BookMyShow",
      value: 400,
      description: "Book movie tickets and entertainment events",
      image: "https://images.unsplash.com/photo-1489599162787-8b4c3e8dd7fe?w=400",
      validityDays: 180,
      category: "Entertainment",
      isActive: true,
      purchaseDate: DateTime.now(),
      expiryDate: DateTime.now().add(const Duration(days: 180)),
    ),
  ];

  final List<GiftCard> myGiftCards = [
    GiftCard(
      id: "7",
      brand: "Amazon",
      value: 1000,
      description: "Amazon Gift Card",
      image: "https://images.unsplash.com/photo-1523474253046-8cd2748b5fd2?w=400",
      validityDays: 365,
      category: "Shopping",
      isActive: true,
      purchaseDate: DateTime.now().subtract(const Duration(days: 30)),
      expiryDate: DateTime.now().add(const Duration(days: 335)),
      code: "AMZ-GIFT-2024-XY7K9",
      balance: 750,
    ),
    GiftCard(
      id: "8",
      brand: "Starbucks",
      value: 500,
      description: "Starbucks Gift Card",
      image: "https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400",
      validityDays: 180,
      category: "Food & Beverage",
      isActive: false,
      purchaseDate: DateTime.now().subtract(const Duration(days: 200)),
      expiryDate: DateTime.now().subtract(const Duration(days: 20)),
      code: "SBX-GIFT-2024-AB3C5",
      balance: 0,
    ),
  ];

  final List<GiftCard> sentGiftCards = [
    GiftCard(
      id: "9",
      brand: "Netflix",
      value: 649,
      description: "Netflix Gift Card sent to John Doe",
      image: "https://images.unsplash.com/photo-1574375927938-d5a98e8ffe85?w=400",
      validityDays: 30,
      category: "Entertainment",
      isActive: true,
      purchaseDate: DateTime.now().subtract(const Duration(days: 5)),
      expiryDate: DateTime.now().add(const Duration(days: 25)),
      recipientName: "John Doe",
      recipientEmail: "john.doe@email.com",
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
                          'Gift Cards',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            _showGiftCardInfoDialog();
                          },
                          icon: const Icon(Icons.info_outline, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Redeem Gift Card Section
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
                            'Redeem Gift Card',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _giftCardCodeController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: 'Enter gift card code',
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
                                onPressed: () => _redeemGiftCard(),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppTheme.accentColor,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                ),
                                child: const Text('Redeem'),
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
                    Tab(text: 'Buy (${availableGiftCards.length})'),
                    Tab(text: 'My Cards (${myGiftCards.length})'),
                    Tab(text: 'Sent (${sentGiftCards.length})'),
                  ],
                ),
              ),

              // Tab Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildBuyGiftCardsList(),
                    _buildMyGiftCardsList(),
                    _buildSentGiftCardsList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBuyGiftCardsList() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: availableGiftCards.length,
      itemBuilder: (context, index) {
        final giftCard = availableGiftCards[index];
        return _buildGiftCardItem(giftCard, 'buy');
      },
    );
  }

  Widget _buildMyGiftCardsList() {
    if (myGiftCards.isEmpty) {
      return _buildEmptyState(
        'No Gift Cards',
        'You don\'t have any gift cards yet. Purchase one from the Buy tab.',
        Icons.card_giftcard,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: myGiftCards.length,
      itemBuilder: (context, index) {
        final giftCard = myGiftCards[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildMyGiftCardItem(giftCard),
        );
      },
    );
  }

  Widget _buildSentGiftCardsList() {
    if (sentGiftCards.isEmpty) {
      return _buildEmptyState(
        'No Sent Gift Cards',
        'Gift cards you send to others will appear here.',
        Icons.send,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: sentGiftCards.length,
      itemBuilder: (context, index) {
        final giftCard = sentGiftCards[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: _buildSentGiftCardItem(giftCard),
        );
      },
    );
  }

  Widget _buildGiftCardItem(GiftCard giftCard, String type) {
    return GestureDetector(
      onTap: () => _showGiftCardDetails(giftCard, type),
      child: Container(
        decoration: AppTheme.cardDecoration.copyWith(
          boxShadow: [
            BoxShadow(
              color: AppTheme.accentColor.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Gift Card Image
            Expanded(
              flex: 3,
              child: Container(
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
                    giftCard.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppTheme.accentColor.withOpacity(0.1),
                        child: const Icon(
                          Icons.card_giftcard,
                          size: 40,
                          color: AppTheme.accentColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            
            // Gift Card Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      giftCard.brand,
                      style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₹${giftCard.value}',
                      style: const TextStyle(
                        color: AppTheme.accentColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      giftCard.category,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                      ),
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

  Widget _buildMyGiftCardItem(GiftCard giftCard) {
    return Container(
      decoration: AppTheme.cardDecoration.copyWith(
        border: giftCard.isActive 
            ? Border.all(color: AppTheme.accentColor.withOpacity(0.3))
            : Border.all(color: AppTheme.errorColor.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: giftCard.isActive 
                  ? AppTheme.accentColor.withOpacity(0.1)
                  : AppTheme.errorColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      giftCard.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppTheme.surfaceColor,
                          child: const Icon(Icons.card_giftcard, color: AppTheme.accentColor),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        giftCard.brand,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '₹${giftCard.value}',
                        style: const TextStyle(
                          color: AppTheme.accentColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: giftCard.isActive ? AppTheme.successColor : AppTheme.errorColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    giftCard.isActive ? 'ACTIVE' : 'EXPIRED',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                if (giftCard.code != null) ...[
                  Row(
                    children: [
                      const Text(
                        'Code: ',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: AppTheme.textMuted.withOpacity(0.3)),
                          ),
                          child: Text(
                            giftCard.code!,
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 12,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _copyToClipboard(giftCard.code!),
                        icon: const Icon(Icons.copy, size: 18, color: AppTheme.accentColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                
                if (giftCard.balance != null) ...[
                  Row(
                    children: [
                      const Text(
                        'Balance: ',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '₹${giftCard.balance}',
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                
                Row(
                  children: [
                    const Text(
                      'Expires: ',
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      _formatDate(giftCard.expiryDate),
                      style: TextStyle(
                        color: giftCard.isActive ? AppTheme.textPrimary : AppTheme.errorColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                
                if (giftCard.isActive) ...[
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _useGiftCard(giftCard),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentColor,
                      ),
                      icon: const Icon(Icons.shopping_cart, size: 18),
                      label: const Text('Use Gift Card'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSentGiftCardItem(GiftCard giftCard) {
    return Container(
      decoration: AppTheme.cardDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  giftCard.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppTheme.surfaceColor,
                      child: const Icon(Icons.card_giftcard, color: AppTheme.accentColor),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${giftCard.brand} - ₹${giftCard.value}',
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Sent to: ${giftCard.recipientName}',
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    giftCard.recipientEmail ?? '',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Sent on: ${_formatDate(giftCard.purchaseDate)}',
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.check_circle,
              color: AppTheme.successColor,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String title, String message, IconData icon) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
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

  void _showGiftCardDetails(GiftCard giftCard, String type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: Text(
          giftCard.brand,
          style: const TextStyle(color: AppTheme.textPrimary),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  giftCard.image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      color: AppTheme.accentColor.withOpacity(0.1),
                      child: const Icon(
                        Icons.card_giftcard,
                        size: 40,
                        color: AppTheme.accentColor,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Text(
                giftCard.description,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Value', '₹${giftCard.value}'),
              _buildDetailRow('Category', giftCard.category),
              _buildDetailRow('Validity', '${giftCard.validityDays} days'),
              if (type == 'buy') ...[
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          _buyGiftCard(giftCard);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentColor,
                        ),
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Buy Now'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          _sendGiftCard(giftCard);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: AppTheme.accentColor),
                          foregroundColor: AppTheme.accentColor,
                        ),
                        icon: const Icon(Icons.send),
                        label: const Text('Send Gift'),
                      ),
                    ),
                  ],
                ),
              ],
            ],
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 14,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Gift card code copied to clipboard'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _redeemGiftCard() {
    final code = _giftCardCodeController.text.trim();
    if (code.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a gift card code'),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    // Simulate redemption
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Gift card "$code" redeemed successfully!'),
        backgroundColor: AppTheme.successColor,
      ),
    );
    _giftCardCodeController.clear();
  }

  void _buyGiftCard(GiftCard giftCard) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${giftCard.brand} gift card purchased successfully!'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _sendGiftCard(GiftCard giftCard) {
    // Show send gift dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Send Gift Card',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Recipient Name',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Recipient Email',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Personal Message (Optional)',
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(color: AppTheme.textPrimary),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${giftCard.brand} gift card sent successfully!'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentColor,
            ),
            child: const Text('Send Gift'),
          ),
        ],
      ),
    );
  }

  void _useGiftCard(GiftCard giftCard) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${giftCard.brand} gift card applied to your cart!'),
        backgroundColor: AppTheme.successColor,
        action: SnackBarAction(
          label: 'View Cart',
          textColor: Colors.white,
          onPressed: () {
            // Navigate to cart
          },
        ),
      ),
    );
  }

  void _showGiftCardInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Gift Cards Info',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '• Buy gift cards for yourself or others',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '• Gift cards can be redeemed using the code',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '• Check expiry dates before using',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '• Unused balance will be carried forward',
                style: TextStyle(color: AppTheme.textSecondary, fontSize: 14),
              ),
              SizedBox(height: 16),
              Text(
                'Note: Gift cards are non-refundable',
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

// Gift Card Model
class GiftCard {
  final String id;
  final String brand;
  final double value;
  final String description;
  final String image;
  final int validityDays;
  final String category;
  final bool isActive;
  final DateTime purchaseDate;
  final DateTime expiryDate;
  final String? code;
  final double? balance;
  final String? recipientName;
  final String? recipientEmail;

  GiftCard({
    required this.id,
    required this.brand,
    required this.value,
    required this.description,
    required this.image,
    required this.validityDays,
    required this.category,
    required this.isActive,
    required this.purchaseDate,
    required this.expiryDate,
    this.code,
    this.balance,
    this.recipientName,
    this.recipientEmail,
  });
}