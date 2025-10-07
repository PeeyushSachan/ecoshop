import 'package:ecoshop/Auth/login_screen.dart';
import 'package:ecoshop/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_listing_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/cart_screen.dart' as cart;
import 'Auth/user/profile_screen.dart' as profile;
import 'theme/app_theme.dart';
import 'models/product_model.dart';
import 'Auth/user/my_orders_screen.dart' as myoders;
import 'Auth/user/manage_address_screen.dart' as myaddress;
import 'Auth/user/payment_methods_screen.dart' as mypayment;
import 'Auth/user/my_wishlist_screen.dart' as wishlist;
import 'Auth/user/coupons_offers_screen.dart' as coupons;
import 'Auth/user/notifications_screen.dart' as notifications;
import 'Auth/user/gift_card_screen.dart' as giftcard;
import 'Auth/user/support_and_Legal/about_us_screen.dart' as aboutus;
import 'Auth/user/support_and_Legal/contact_us_screen.dart' as contactus;
import 'Auth/user/support_and_Legal/help_center_screen.dart' as helpcenter;
import 'Auth/user/support_and_Legal/privacy_policy_screen.dart' as privacypolicy;
import 'Auth/user/support_and_Legal/terms_conditions_screen.dart' as termsconditions;

void main() {
  runApp(const EcoShopApp());
}

class EcoShopApp extends StatelessWidget {
  const EcoShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return MaterialApp(
      title: 'EcoShop',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const MainNavigation(),
        '/categories': (context) => const CategoriesScreen(),

        '/product-listing': (context) => const ProductListingScreen(),
        '/cart': (context) => const cart.CartScreen(),

        // User Authentication
        '/profile': (context) => const profile.ProfileScreen(),
        '/orders': (context) => const myoders.MyOrdersScreen(),
        '/manage-address': (context) => const myaddress.ManageAddressScreen(),
        '/payment-method': (context) => const mypayment.PaymentMethodsScreen(),
        '/my-wishlist': (context) => const wishlist.MyWishlistScreen(),
        '/coupons-and-offers': (context) => const coupons.CouponsOffersScreen(),
       '/notifications':(context) => const notifications.NotificationsScreen(),
       '/gift-card':(context)=> const giftcard.GiftCardScreen(),


       //support and legal
        '/about-us':(context) => const aboutus.AboutUsScreen(),
        '/contact-us':(context) => const contactus.ContactUsScreen(),
        '/help-center':(context) => const helpcenter.HelpCenterScreen(),
        '/privacy-policy':(context) => const privacypolicy.PrivacyPolicyScreen(),
        '/terms-and-conditions':(context) => const termsconditions.TermsConditionsScreen(),
       
      },
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const HomeScreen(),
    const ProductListingScreen(),
    const SearchScreen(),
    const cart.CartScreen(),
    const profile.ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.6),
          selectedFontSize: 12,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_outlined),
              activeIcon: Icon(Icons.grid_view),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              activeIcon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.primaryGradient,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.accentColor.withOpacity(0.3)),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search products...',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Recent Searches
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Searches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Search suggestions
              Expanded(
                child: ListView(
                  children: [
                    _buildSearchSuggestion('iPhone 15'),
                    _buildSearchSuggestion('Nike Shoes'),
                    _buildSearchSuggestion('MacBook Air'),
                    _buildSearchSuggestion('Wireless Headphones'),
                    _buildSearchSuggestion('Running Shoes'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSuggestion(String query) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Icon(Icons.history, color: Colors.white70, size: 20),
          const SizedBox(width: 12),
          Text(
            query,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Spacer(),
          Icon(Icons.north_west, color: Colors.white70, size: 16),
        ],
      ),
    );
  }
}