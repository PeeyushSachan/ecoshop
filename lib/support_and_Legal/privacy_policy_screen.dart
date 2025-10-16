import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
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
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showDataRightsDialog();
                      },
                      icon: const Icon(Icons.account_circle, color: Colors.white),
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
                                    Icons.privacy_tip,
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
                                        'Privacy Policy',
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
                                'Your privacy is important to us. This Privacy Policy explains how EcoShop collects, uses, and protects your personal information when you use our mobile application.',
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

                      // Quick Privacy Summary
                      _buildSection(
                        'Privacy at a Glance',
                        Icons.visibility,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildQuickSummaryItem('Data Collection', 'We collect only necessary information for app functionality', Icons.data_usage, Colors.blue),
                            _buildQuickSummaryItem('Data Usage', 'Your data is used to provide and improve our services', Icons.settings, Colors.green),
                            _buildQuickSummaryItem('Data Sharing', 'We never sell your personal information to third parties', Icons.share, Colors.orange),
                            _buildQuickSummaryItem('Data Security', 'Your information is protected with industry-standard security', Icons.security, Colors.red),
                            _buildQuickSummaryItem('Your Rights', 'You can access, update, or delete your data anytime', Icons.account_circle, Colors.purple),
                          ],
                        ),
                      ),

                      // 1. Information We Collect
                      _buildSection(
                        '1. Information We Collect',
                        Icons.info,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDataCategory(
                              'Personal Information',
                              '• Full name and contact details\n• Email address and phone number\n• Delivery addresses\n• Date of birth (optional)',
                              Icons.person,
                            ),
                            const SizedBox(height: 16),
                            _buildDataCategory(
                              'Account Information',
                              '• Username and password\n• Profile picture (optional)\n• Account preferences and settings\n• Purchase history and wishlist',
                              Icons.account_box,
                            ),
                            const SizedBox(height: 16),
                            _buildDataCategory(
                              'Payment Information',
                              '• Credit/debit card details (encrypted)\n• UPI IDs and wallet information\n• Billing addresses\n• Transaction history',
                              Icons.payment,
                            ),
                            const SizedBox(height: 16),
                            _buildDataCategory(
                              'Device Information',
                              '• Device type and operating system\n• App version and usage analytics\n• IP address and location data\n• Push notification preferences',
                              Icons.phone_android,
                            ),
                          ],
                        ),
                      ),

                      // 2. How We Use Your Information
                      _buildSection(
                        '2. How We Use Your Information',
                        Icons.settings,
                        const Text(
                          'We use your information for the following purposes:\n\nService Delivery:\n• Process and fulfill your orders\n• Provide customer support\n• Send order updates and notifications\n• Manage your account and preferences\n\nService Improvement:\n• Analyze app usage and performance\n• Develop new features and services\n• Personalize your shopping experience\n• Conduct research and analytics\n\nCommunication:\n• Send promotional offers and updates\n• Provide customer service responses\n• Send security alerts and important notices\n• Collect feedback and reviews\n\nLegal Compliance:\n• Comply with applicable laws and regulations\n• Prevent fraud and security threats\n• Resolve disputes and enforce agreements\n• Maintain business records',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 3. Information Sharing
                      _buildSection(
                        '3. Information Sharing and Disclosure',
                        Icons.share,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'We may share your information in the following circumstances:',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildSharingCategory(
                              'Service Providers',
                              'Payment processors, delivery partners, cloud storage providers, and analytics services',
                              Icons.business,
                              Colors.blue,
                            ),
                            _buildSharingCategory(
                              'Legal Requirements',
                              'When required by law, court orders, or government requests',
                              Icons.gavel,
                              Colors.red,
                            ),
                            _buildSharingCategory(
                              'Business Transfers',
                              'In case of merger, acquisition, or sale of business assets',
                              Icons.transfer_within_a_station,
                              Colors.orange,
                            ),
                            _buildSharingCategory(
                              'Consent',
                              'With your explicit consent for specific purposes',
                              Icons.check_circle,
                              Colors.green,
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppTheme.successColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppTheme.successColor.withOpacity(0.3)),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.verified_user,
                                    color: AppTheme.successColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  const Expanded(
                                    child: Text(
                                      'We never sell your personal information to third parties for marketing purposes.',
                                      style: TextStyle(
                                        color: AppTheme.textPrimary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // 4. Data Security
                      _buildSection(
                        '4. Data Security',
                        Icons.security,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'We implement multiple layers of security to protect your information:',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildSecurityMeasure('Encryption', 'All sensitive data is encrypted in transit and at rest', Icons.lock),
                            _buildSecurityMeasure('Access Control', 'Strict access controls and authentication requirements', Icons.verified_user),
                            _buildSecurityMeasure('Regular Audits', 'Regular security assessments and vulnerability testing', Icons.search),
                            _buildSecurityMeasure('Secure Infrastructure', 'Industry-standard data centers and cloud security', Icons.cloud_done),
                            _buildSecurityMeasure('Employee Training', 'Regular privacy and security training for all staff', Icons.school),
                          ],
                        ),
                      ),

                      // 5. Your Privacy Rights
                      _buildSection(
                        '5. Your Privacy Rights',
                        Icons.account_circle,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'You have the following rights regarding your personal information:',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildPrivacyRight('Access', 'Request a copy of your personal information', Icons.download),
                            _buildPrivacyRight('Update', 'Correct or update your information', Icons.edit),
                            _buildPrivacyRight('Delete', 'Request deletion of your account and data', Icons.delete),
                            _buildPrivacyRight('Portability', 'Export your data in a common format', Icons.import_export),
                            _buildPrivacyRight('Withdraw Consent', 'Opt-out of marketing communications', Icons.unsubscribe),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      _showDataRequestDialog();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppTheme.accentColor,
                                    ),
                                    icon: const Icon(Icons.privacy_tip),
                                    label: const Text('Manage My Data'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // 6. Cookies and Tracking
                      _buildSection(
                        '6. Cookies and Tracking Technologies',
                        Icons.cookie,
                        const Text(
                          'We use various technologies to collect and store information:\n\nCookies:\n• Essential cookies for app functionality\n• Performance cookies for analytics\n• Preference cookies for customization\n\nAnalytics:\n• Google Analytics for usage statistics\n• Firebase Analytics for app performance\n• Custom analytics for business insights\n\nAdvertising:\n• We do not use third-party advertising cookies\n• No behavioral advertising or tracking\n• All analytics data is anonymized\n\nYou can manage cookie preferences in your device settings.',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 7. Data Retention
                      _buildSection(
                        '7. Data Retention',
                        Icons.schedule,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'We retain your information for the following periods:',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildRetentionPeriod('Account Information', 'Until account deletion + 90 days'),
                            _buildRetentionPeriod('Transaction Records', '7 years (legal requirement)'),
                            _buildRetentionPeriod('Marketing Data', 'Until you unsubscribe + 30 days'),
                            _buildRetentionPeriod('Analytics Data', '26 months (anonymized)'),
                            _buildRetentionPeriod('Support Tickets', '3 years after resolution'),
                          ],
                        ),
                      ),

                      // 8. Children's Privacy
                      _buildSection(
                        '8. Children\'s Privacy',
                        Icons.child_care,
                        const Text(
                          'Protecting children\'s privacy is important to us:\n\n• Our service is not intended for children under 13\n• We do not knowingly collect information from children under 13\n• Parents can request deletion of their child\'s information\n• We encourage parents to monitor their children\'s online activities\n\nIf you believe we have collected information from a child under 13, please contact us immediately.',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 9. International Transfers
                      _buildSection(
                        '9. International Data Transfers',
                        Icons.public,
                        const Text(
                          'Data Processing Locations:\n• Primary data processing occurs in India\n• Some service providers may process data internationally\n• All transfers comply with applicable data protection laws\n• Appropriate safeguards are in place for cross-border transfers\n\nSafeguards:\n• Standard contractual clauses with service providers\n• Adequacy decisions where applicable\n• Your explicit consent for specific transfers',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 10. Updates to Privacy Policy
                      _buildSection(
                        '10. Updates to This Privacy Policy',
                        Icons.update,
                        const Text(
                          'Policy Changes:\n• We may update this Privacy Policy periodically\n• Material changes will be communicated via app notification\n• Continued use constitutes acceptance of changes\n• Previous versions are available upon request\n\nNotification Methods:\n• In-app notifications for significant changes\n• Email notifications to registered users\n• Prominent notice on app home screen\n• Updated "last modified" date at the top',
                          style: TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                            height: 1.6,
                          ),
                        ),
                      ),

                      // 11. Contact Information
                      _buildSection(
                        '11. Contact Us',
                        Icons.contact_mail,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'For privacy-related questions or concerns, contact us:',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 14,
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildContactInfo('Privacy Officer:', 'privacy@ecoshop.com'),
                            _buildContactInfo('Phone:', '+91 1800-123-4567'),
                            _buildContactInfo('Address:', 'EcoShop Technologies Pvt. Ltd.\nData Protection Officer\n123 Business Park, Sector 15\nGurgaon, Haryana 122001'),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
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
                              'Your Privacy Matters',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'We are committed to protecting your privacy and being transparent about how we use your information.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Privacy Policy Version 2.1\nEffective Date: January 1, 2024',
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

  Widget _buildQuickSummaryItem(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCategory(String title, String items, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.textMuted.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.accentColor, size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            items,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSharingCategory(String title, String description, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 14),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityMeasure(String title, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppTheme.successColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: AppTheme.successColor, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacyRight(String title, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.accentColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRetentionPeriod(String dataType, String period) {
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
          Expanded(
            child: Text(
              '$dataType: $period',
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
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
            width: 80,
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

  void _showDataRightsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Your Data Rights',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You have the right to:',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                '• Request a copy of your personal data\n• Correct inaccurate information\n• Delete your account and data\n• Opt-out of marketing communications\n• Export your data',
                style: TextStyle(color: AppTheme.textSecondary),
              ),
              SizedBox(height: 16),
              Text(
                'Response Time: We will respond to your request within 30 days.',
                style: TextStyle(
                  color: AppTheme.accentColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showDataRequestDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.accentColor,
            ),
            child: const Text('Submit Request'),
          ),
        ],
      ),
    );
  }

  void _showDataRequestDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Data Request',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'What would you like to do with your data?',
              style: TextStyle(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data export request submitted')),
                  );
                },
                child: const Text('Download My Data'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Data deletion request submitted')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.errorColor,
                ),
                child: const Text('Delete My Data'),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}