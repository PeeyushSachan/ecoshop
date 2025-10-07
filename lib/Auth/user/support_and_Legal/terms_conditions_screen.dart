import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _isScrolled = _scrollController.offset > 0;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
          child: Column(
            children: [
              // App Bar
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  boxShadow: _isScrolled ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ] : null,
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    const Expanded(
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showSearchDialog();
                      },
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: AppTheme.cardDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    gradient: AppTheme.primaryGradient,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.description,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Terms & Conditions',
                                        style: TextStyle(
                                          color: AppTheme.textPrimary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Last updated: January 1, 2024',
                                        style: TextStyle(
                                          color: AppTheme.textMuted,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppTheme.accentColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Please read these Terms and Conditions carefully before using the EcoShop mobile application. By accessing or using our service, you agree to be bound by these Terms.',
                                style: TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Table of Contents
                      _buildSection(
                        'Table of Contents',
                        Icons.list,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildTOCItem('1. Acceptance of Terms'),
                            _buildTOCItem('2. Description of Service'),
                            _buildTOCItem('3. User Accounts'),
                            _buildTOCItem('4. Orders and Payments'),
                            _buildTOCItem('5. Shipping and Delivery'),
                            _buildTOCItem('6. Returns and Refunds'),
                            _buildTOCItem('7. User Conduct'),
                            _buildTOCItem('8. Intellectual Property'),
                            _buildTOCItem('9. Privacy Policy'),
                            _buildTOCItem('10. Limitation of Liability'),
                            _buildTOCItem('11. Termination'),
                            _buildTOCItem('12. Governing Law'),
                            _buildTOCItem('13. Contact Information'),
                          ],
                        ),
                      ),

                      // 1. Acceptance of Terms
                      _buildSection(
                        '1. Acceptance of Terms',
                        Icons.check_circle,
                        const Text(
                          'By downloading, installing, or using the EcoShop mobile application ("App"), you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our App.\n\nThese Terms constitute a legally binding agreement between you ("User") and EcoShop Technologies Pvt. Ltd. ("Company", "we", "us", or "our").',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 2. Description of Service
                      _buildSection(
                        '2. Description of Service',
                        Icons.shopping_bag,
                        const Text(
                          'EcoShop is an e-commerce platform that provides:\n\n• Access to a wide range of sustainable and eco-friendly products\n• Online ordering and payment processing\n• Delivery services\n• Customer support\n• User account management\n• Wishlist and cart functionality\n\nWe reserve the right to modify, suspend, or discontinue any part of our service at any time without prior notice.',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 3. User Accounts
                      _buildSection(
                        '3. User Accounts',
                        Icons.person,
                        const Text(
                          'Account Creation:\n• You must be at least 18 years old to create an account\n• You must provide accurate and complete information\n• You are responsible for maintaining account security\n• One person may not maintain more than one account\n\nAccount Security:\n• Keep your login credentials confidential\n• Notify us immediately of any unauthorized use\n• You are responsible for all activities under your account\n\nAccount Termination:\nWe may suspend or terminate accounts that violate these Terms or engage in fraudulent activities.',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 4. Orders and Payments
                      _buildSection(
                        '4. Orders and Payments',
                        Icons.payment,
                        const Text(
                          'Order Process:\n• All orders are subject to acceptance and availability\n• We reserve the right to refuse or cancel any order\n• Prices are subject to change without notice\n• Order confirmation does not guarantee product availability\n\nPayment Terms:\n• Payment is required at the time of ordering\n• We accept various payment methods as displayed in the app\n• All transactions are processed securely\n• Additional charges may apply for certain payment methods\n\nPricing:\n• All prices are in Indian Rupees (INR) unless stated otherwise\n• Prices include applicable taxes unless stated otherwise\n• Delivery charges are additional and will be clearly displayed',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 5. Shipping and Delivery
                      _buildSection(
                        '5. Shipping and Delivery',
                        Icons.local_shipping,
                        const Text(
                          'Delivery Areas:\n• We currently deliver to major cities across India\n• Delivery availability is subject to location and product\n• Remote areas may have limited delivery options\n\nDelivery Timeframes:\n• Standard delivery: 3-7 business days\n• Express delivery: 1-2 business days (where available)\n• Delivery times are estimates and not guaranteed\n\nDelivery Process:\n• You must provide accurate delivery address\n• Someone must be available to receive the order\n• We may require signature confirmation for high-value items\n• Failed delivery attempts may result in return to origin',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 6. Returns and Refunds
                      _buildSection(
                        '6. Returns and Refunds',
                        Icons.keyboard_return,
                        const Text(
                          'Return Policy:\n• Most items can be returned within 30 days of delivery\n• Items must be in original condition with packaging\n• Some items (perishables, personalized items) cannot be returned\n• Return shipping may be charged to the customer\n\nRefund Process:\n• Refunds are processed within 5-7 business days\n• Refunds are issued to the original payment method\n• Processing fees may be deducted from refund amount\n\nExchanges:\n• Subject to availability of replacement item\n• Size and color exchanges are allowed within return period\n• Price differences must be paid for upgraded items',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 7. User Conduct
                      _buildSection(
                        '7. User Conduct',
                        Icons.rule,
                        const Text(
                          'Prohibited Activities:\n• Providing false or misleading information\n• Using the app for illegal purposes\n• Attempting to hack or reverse engineer the app\n• Creating multiple accounts\n• Abusing return/refund policies\n• Posting inappropriate content in reviews\n\nConsequences:\nViolation of these rules may result in:\n• Account suspension or termination\n• Legal action\n• Forfeiture of pending orders or refunds',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 8. Intellectual Property
                      _buildSection(
                        '8. Intellectual Property',
                        Icons.copyright,
                        const Text(
                          'Our Rights:\n• The EcoShop app and all content are protected by copyright\n• Trademarks, logos, and brand names are our property\n• You may not copy, modify, or distribute our content\n• All product descriptions and images are proprietary\n\nUser Content:\n• You retain rights to content you create (reviews, photos)\n• You grant us license to use your content for promotional purposes\n• You are responsible for ensuring you have rights to uploaded content\n• We may remove user content that violates our policies',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 9. Privacy Policy
                      _buildSection(
                        '9. Privacy Policy',
                        Icons.privacy_tip,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Your privacy is important to us. Our data collection and usage practices are detailed in our Privacy Policy, which is incorporated into these Terms by reference.\n\nKey Privacy Points:\n• We collect only necessary personal information\n• Your data is stored securely\n• We do not sell your personal information to third parties\n• You can request deletion of your data',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/privacy-policy');
                              },
                              child: const Text(
                                'View Full Privacy Policy →',
                                style: TextStyle(
                                  color: AppTheme.accentColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 10. Limitation of Liability
                      _buildSection(
                        '10. Limitation of Liability',
                        Icons.gavel,
                        const Text(
                          'Disclaimer:\n• The app is provided "as is" without warranties\n• We are not liable for indirect or consequential damages\n• Our liability is limited to the amount of your purchase\n• We do not guarantee uninterrupted service\n\nForce Majeure:\nWe are not responsible for delays or failures due to:\n• Natural disasters\n• Government actions\n• Technical failures beyond our control\n• Pandemic or health emergencies',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 11. Termination
                      _buildSection(
                        '11. Termination',
                        Icons.exit_to_app,
                        const Text(
                          'Termination by User:\n• You may delete your account at any time\n• Outstanding orders must be completed or cancelled\n• Some data may be retained for legal compliance\n\nTermination by EcoShop:\n• We may terminate accounts for Terms violations\n• We may discontinue the service with reasonable notice\n• Upon termination, your right to use the app ends immediately',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 12. Governing Law
                      _buildSection(
                        '12. Governing Law',
                        Icons.balance,
                        const Text(
                          'These Terms are governed by the laws of India. Any disputes will be resolved in the courts of Gurgaon, Haryana.\n\nDispute Resolution:\n• We encourage resolving disputes through customer service first\n• Mediation may be required before legal action\n• Class action lawsuits are not permitted\n• Individual arbitration may be required for certain disputes',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 13. Contact Information
                      _buildSection(
                        '13. Contact Information',
                        Icons.contact_mail,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'For questions about these Terms and Conditions, please contact us:',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildContactInfo('Email:', 'legal@ecoshop.com'),
                            _buildContactInfo('Phone:', '+91 1800-123-4567'),
                            _buildContactInfo('Address:', 'EcoShop Technologies Pvt. Ltd.\n123 Business Park, Sector 15\nGurgaon, Haryana 122001'),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/contact-us');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.accentColor,
                                ),
                                icon: const Icon(Icons.support_agent),
                                label: const Text('Contact Support'),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Footer
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.verified_user,
                              color: Colors.white,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Thank You for Reading',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'By using EcoShop, you agree to these Terms and Conditions. We appreciate your trust in our platform.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Last Updated: January 1, 2024\nEffective Date: January 1, 2024',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
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

  Widget _buildSection(String title, IconData icon, Widget content) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: AppTheme.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.accentColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    icon,
                    color: AppTheme.accentColor,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _buildTOCItem(String item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppTheme.accentColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            item,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSearchDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Search Terms',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Search in Terms & Conditions...',
            prefixIcon: Icon(Icons.search),
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
}