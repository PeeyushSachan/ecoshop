import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<FAQItem> _filteredFAQs = [];

  final List<FAQItem> allFAQs = [
    FAQItem(
      question: "How do I track my order?",
      answer: "You can track your order by going to 'My Orders' section in your profile. Click on the order you want to track and you'll see real-time updates including current status, estimated delivery time, and tracking number.",
      category: "Orders",
      isExpanded: false,
    ),
    FAQItem(
      question: "What payment methods do you accept?",
      answer: "We accept various payment methods including Credit/Debit cards (Visa, Mastercard, American Express), UPI payments, Net Banking, Digital Wallets (Paytm, PhonePe, Google Pay), and Cash on Delivery (COD) for eligible orders.",
      category: "Payment",
      isExpanded: false,
    ),
    FAQItem(
      question: "How can I return or exchange an item?",
      answer: "You can return most items within 30 days of delivery. Go to 'My Orders', select the item you want to return, choose a reason, and schedule a pickup. Refunds are processed within 5-7 business days after we receive the returned item.",
      category: "Returns",
      isExpanded: false,
    ),
    FAQItem(
      question: "How do I cancel my order?",
      answer: "You can cancel your order before it's shipped. Go to 'My Orders', find your order, and click 'Cancel Order'. If the order has already been shipped, you'll need to return it after delivery.",
      category: "Orders",
      isExpanded: false,
    ),
    FAQItem(
      question: "Is it safe to save my payment information?",
      answer: "Yes, your payment information is completely secure. We use industry-standard encryption and comply with PCI DSS standards. Your card details are tokenized and stored securely with our payment partners.",
      category: "Security",
      isExpanded: false,
    ),
    FAQItem(
      question: "How do I change my delivery address?",
      answer: "You can change your delivery address before the order is shipped. Go to 'My Orders', select the order, and click 'Change Address'. You can also manage your saved addresses in the 'Manage Addresses' section.",
      category: "Delivery",
      isExpanded: false,
    ),
    FAQItem(
      question: "What are the delivery charges?",
      answer: "Delivery charges vary based on order value and location. Orders above ₹499 get free delivery. Express delivery is available for ₹99 extra. Remote locations may have additional charges.",
      category: "Delivery",
      isExpanded: false,
    ),
    FAQItem(
      question: "How do I use coupons and offers?",
      answer: "Browse available coupons in the 'Coupons & Offers' section. Copy the coupon code and apply it during checkout. You can also enter coupon codes manually in the 'Apply Coupon' field at checkout.",
      category: "Offers",
      isExpanded: false,
    ),
    FAQItem(
      question: "Can I modify my order after placing it?",
      answer: "You can modify your order (add/remove items, change address) only if it hasn't been processed yet. This is usually within 1-2 hours of placing the order. Contact customer support for assistance.",
      category: "Orders",
      isExpanded: false,
    ),
    FAQItem(
      question: "How do I create an account?",
      answer: "Click on 'Sign Up' on the login screen. Enter your details including name, email, and phone number. Verify your phone number with the OTP sent to you. You can also sign up using Google or Facebook.",
      category: "Account",
      isExpanded: false,
    ),
  ];

  final List<HelpCategory> helpCategories = [
    HelpCategory(
      title: "Orders & Delivery",
      icon: Icons.local_shipping,
      color: Colors.blue,
      description: "Track orders, delivery info, and shipping queries",
    ),
    HelpCategory(
      title: "Payment & Refunds",
      icon: Icons.payment,
      color: Colors.green,
      description: "Payment methods, refunds, and billing issues",
    ),
    HelpCategory(
      title: "Returns & Exchanges",
      icon: Icons.keyboard_return,
      color: Colors.orange,
      description: "Return policy, exchange process, and refunds",
    ),
    HelpCategory(
      title: "Account & Profile",
      icon: Icons.person,
      color: Colors.purple,
      description: "Account settings, profile management, and security",
    ),
    HelpCategory(
      title: "Technical Support",
      icon: Icons.build,
      color: Colors.red,
      description: "App issues, technical problems, and troubleshooting",
    ),
    HelpCategory(
      title: "Offers & Coupons",
      icon: Icons.local_offer,
      color: AppTheme.accentColor,
      description: "Discount codes, offers, and promotional campaigns",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _filteredFAQs = allFAQs;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterFAQs(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredFAQs = allFAQs;
      } else {
        _filteredFAQs = allFAQs.where((faq) {
          return faq.question.toLowerCase().contains(query.toLowerCase()) ||
                 faq.answer.toLowerCase().contains(query.toLowerCase());
        }).toList();
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
                          'Help Center',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // Contact support
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Opening contact support...')),
                            );
                          },
                          icon: const Icon(Icons.support_agent, color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Search Bar
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _searchController,
                        onChanged: _filterFAQs,
                        decoration: InputDecoration(
                          hintText: 'Search for help...',
                          prefixIcon: const Icon(Icons.search, color: AppTheme.textMuted),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Quick Actions
                      const Text(
                        'Quick Help',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: helpCategories.length,
                        itemBuilder: (context, index) {
                          final category = helpCategories[index];
                          return _buildCategoryCard(category);
                        },
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // FAQ Section
                      Row(
                        children: [
                          const Text(
                            'Frequently Asked Questions',
                            style: TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${_filteredFAQs.length} results',
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // FAQ List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _filteredFAQs.length,
                        itemBuilder: (context, index) {
                          final faq = _filteredFAQs[index];
                          return _buildFAQItem(faq, index);
                        },
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Contact Support Card
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: AppTheme.accentGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.support_agent,
                              color: Colors.white,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Still need help?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Our support team is here to help you 24/7',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Navigate to contact us
                                      Navigator.pushNamed(context, '/contact-us');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: AppTheme.accentColor,
                                    ),
                                    icon: const Icon(Icons.chat),
                                    label: const Text('Contact Us'),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      // Call support
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text('Calling support: 1800-123-4567')),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: AppTheme.accentColor,
                                    ),
                                    icon: const Icon(Icons.phone),
                                    label: const Text('Call Us'),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(HelpCategory category) {
    return GestureDetector(
      onTap: () {
        // Filter FAQs by category
        final categoryFAQs = allFAQs.where((faq) => 
          faq.category.toLowerCase().contains(category.title.split(' ').first.toLowerCase())
        ).toList();
        
        setState(() {
          _filteredFAQs = categoryFAQs;
          _searchController.text = category.title.split(' ').first;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: category.color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                category.icon,
                color: category.color,
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              category.title,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              category.description,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(FAQItem faq, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: AppTheme.cardDecoration,
      child: ExpansionTile(
        title: Text(
          faq.question,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppTheme.accentColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                color: AppTheme.accentColor,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        trailing: Icon(
          faq.isExpanded ? Icons.expand_less : Icons.expand_more,
          color: AppTheme.accentColor,
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Text(
              faq.answer,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            faq.isExpanded = expanded;
          });
        },
      ),
    );
  }
}

// Models
class FAQItem {
  final String question;
  final String answer;
  final String category;
  bool isExpanded;

  FAQItem({
    required this.question,
    required this.answer,
    required this.category,
    required this.isExpanded,
  });
}

class HelpCategory {
  final String title;
  final IconData icon;
  final Color color;
  final String description;

  HelpCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.description,
  });
}