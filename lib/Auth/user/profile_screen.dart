

import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../models/product_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final UserProfile user = UserProfile(
    name: "John Doe",
    email: "john.doe@example.com",
    phone: "+91 98765 43210",
    avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100",
    orders: 23,
    wishlist: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header with Profile Info
                _buildProfileHeader(),
                
                // Quick Stats
                _buildQuickStats(),
                
                // Menu Options
                _buildMenuOptions(),
                
                // Bottom Section
                _buildBottomSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        gradient: AppTheme.primaryGradient,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  // Settings
                },
                icon: const Icon(Icons.settings, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          // Profile Avatar and Info
          Row(
            children: [
              // Avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.network(
                    user.avatar ?? 'https://via.placeholder.com/80',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.white,
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: AppTheme.primaryDark,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 20),
              
              // User Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user.email,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    if (user.phone != null)
                      Text(
                        user.phone!,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                  ],
                ),
              ),
              
              // Edit Button
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  onPressed: () {
                    // Edit profile
                  },
                  icon: const Icon(Icons.edit, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          _buildStatCard(
            icon: Icons.shopping_bag_outlined,
            label: 'Orders',
            value: user.orders.toString(),
            color: AppTheme.accentColor,
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            onTap: () {
              Navigator.pushNamed(context, '/my-wishlist');
            },
           
            icon: Icons.favorite_outline,
            label: 'Wishlist',
            value: user.wishlist.toString(),
            color: AppTheme.errorColor,
          ),
          const SizedBox(width: 16),
          _buildStatCard(
            icon: Icons.wallet_outlined,
            label: 'Wallet',
            value: '₹1,250',
            color: AppTheme.successColor,
          ),
        ],
      ),
    );
  }

Widget _buildStatCard({
  required IconData icon,
  required String label,
  required String value,
  required Color color,
  VoidCallback? onTap, // 👈 callback parameter add kiya
}) {
  return Expanded(
    child: GestureDetector(
      onTap: onTap, // 👈 ye tab chalega jab user card pe tap karega
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: AppTheme.cardDecoration,
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


  Widget _buildMenuOptions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: AppTheme.cardDecoration,
      child: Column(
        children: [
          _buildMenuItem(
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
            subtitle: 'Track, return or buy things again',
            onTap: () {

              Navigator.pushNamed(context, '/orders');  
            },
          ),
          const Divider(height: 1),
          _buildMenuItem(
            icon: Icons.location_on_outlined,
            title: 'Manage Addresses',
            subtitle: 'Save addresses for a faster checkout',
            onTap: () {

              Navigator.pushNamed(context, '/manage-address');  
            },
          ),
          const Divider(height: 1),
          _buildMenuItem(
            icon: Icons.payment_outlined,
            title: 'Payment Methods',
            subtitle: 'Manage your saved cards and wallets',
            onTap: () {
              Navigator.pushNamed(context, '/payment-method');

            },
          ),
          const Divider(height: 1),
          _buildMenuItem(
            icon: Icons.favorite_outline,
            title: 'My Wishlist',
            subtitle: 'Your most loved products',
            onTap: () {

               Navigator.pushNamed(context, '/my-wishlist');
            },
          ),
          const Divider(height: 1),
          _buildMenuItem(
            icon: Icons.local_offer_outlined,
            title: 'Coupons & Offers',
            subtitle: 'Get exciting deals and offers',
            onTap: () {
                Navigator.pushNamed(context, '/coupons-and-offers');
            },
          ),
          const Divider(height: 1),
          _buildMenuItem(
            icon: Icons.card_giftcard_outlined,
            title: 'Gift Cards',
            subtitle: 'Buy, gift and redeem gift cards',
            onTap: () {
                Navigator.pushNamed(context, '/gift-card');
            },
          ),
          const Divider(height: 1),
          _buildMenuItem(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Manage your notification preferences',
            onTap: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppTheme.accentColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppTheme.accentColor, size: 24),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: AppTheme.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: AppTheme.textMuted,
          fontSize: 12,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppTheme.textMuted,
        size: 16,
      ),
      onTap: onTap,
    );
  }

  Widget _buildBottomSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Support Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: AppTheme.cardDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Support & Legal',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSupportItem('Help Center', Icons.help_outline ,  () {
                  Navigator.pushNamed(context, '/help-center');
                }),
                _buildSupportItem('Contact Us', Icons.contact_support_outlined, () {
                  Navigator.pushNamed(context, '/contact-us');
                }),
                _buildSupportItem('About Us', Icons.info_outline, () {
                  Navigator.pushNamed(context, '/about-us');
                }),
                _buildSupportItem('Terms & Conditions', Icons.description_outlined, () {
                  Navigator.pushNamed(context, '/terms-and-conditions');
                }),
                _buildSupportItem('Privacy Policy', Icons.privacy_tip_outlined, () {
                  Navigator.pushNamed(context, '/privacy-policy');
                }),
              ],
            ),
          ),
          const SizedBox(height: 16),
          
          // App Settings
          Container(
            padding: const EdgeInsets.all(16),
            decoration: AppTheme.cardDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'App Settings',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSettingsItem('Language', 'English', Icons.language),
                _buildSettingsItem('Currency', 'INR (₹)', Icons.currency_rupee),
                _buildSettingsItem('Dark Mode', 'Enabled', Icons.dark_mode_outlined),
              ],
            ),
          ),
          const SizedBox(height: 24),
          
          // Logout Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                _showLogoutDialog();
              },
              icon: const Icon(Icons.logout, color: AppTheme.errorColor),
              label: const Text(
                'Logout',
                style: TextStyle(
                  color: AppTheme.errorColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppTheme.errorColor),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          // Version Info
          Text(
            'EcoShop v1.0.0',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSupportItem(String title, IconData icon, VoidCallback? onTap) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppTheme.textMuted, size: 20),
      title: Text(
        title,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 14,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: AppTheme.textMuted,
        size: 12,
      ),
      onTap: onTap

      
    );
  }

  Widget _buildSettingsItem(String title, String value, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: AppTheme.textMuted, size: 20),
      title: Text(
        title,
        style: const TextStyle(
          color: AppTheme.textSecondary,
          fontSize: 14,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.textMuted,
            size: 12,
          ),
        ],
      ),
      onTap: () {
        // Navigate to settings page
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.surfaceColor,
        title: const Text(
          'Logout',
          style: TextStyle(color: AppTheme.textPrimary),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Perform logout
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out successfully'),
                  backgroundColor: AppTheme.successColor,
                ),
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: AppTheme.errorColor),
            ),
          ),
        ],
      ),
    );
  }
}