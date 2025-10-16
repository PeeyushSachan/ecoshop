import 'package:ecoshop/screens/auth/login_screen.dart';
import 'package:ecoshop/screens/promotions/mega_sale_screen.dart';
import 'package:ecoshop/screens/shop/category_screen.dart';
import 'package:ecoshop/screens/mics/main_navigation.dart';
import 'package:ecoshop/screens/shop/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/mics/splash_screen.dart';
import 'screens/shop/home_screen.dart';
import 'screens/shop/product_listing_screen.dart';
import 'screens/shop/product_detail_screen.dart';
import 'screens/shop/cart_screen.dart' as cart;
import 'screens/profile/profile_screen.dart' as profile;
import 'theme/app_theme.dart';
import 'models/product/product_model.dart';
import 'screens/profile/my_orders_screen.dart' as myoders;
import 'screens/profile/manage_address_screen.dart' as myaddress;
import 'screens/profile/payment_methods_screen.dart' as mypayment;
import 'screens/profile/my_wishlist_screen.dart' as wishlist;
import 'screens/profile/coupons_offers_screen.dart' as coupons;
import 'screens/profile/notifications_screen.dart' as notifications;
import 'screens/profile/gift_card_screen.dart' as giftcard;
import 'support_and_Legal/about_us_screen.dart' as aboutus;
import 'support_and_Legal/contact_us_screen.dart' as contactus;
import 'support_and_Legal/help_center_screen.dart' as helpcenter;
import 'support_and_Legal/privacy_policy_screen.dart' as privacypolicy;
import 'support_and_Legal/terms_conditions_screen.dart' as termsconditions;
import 'screens/promotions/flash_sale_screen.dart';
import 'screens/promotions/new_arrivals_screen.dart';
import 'screens/promotions/electronics_fest_screen.dart';
import 'screens/profile/edit_profile_screen.dart';

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

       //edit profile
       '/edit-profile':(context) => const EditProfileScreen(),


       //support and legal
        '/about-us':(context) => const aboutus.AboutUsScreen(),
        '/contact-us':(context) => const contactus.ContactUsScreen(),
        '/help-center':(context) => const helpcenter.HelpCenterScreen(),
        '/privacy-policy':(context) => const privacypolicy.PrivacyPolicyScreen(),
        '/terms-and-conditions':(context) => const termsconditions.TermsConditionsScreen(),


        //flash sale
        '/flash-sale': (context) => const FlashSaleScreen(),

//sales events
         '/mega-sale': (context) => const MegaSaleScreen(),
 '/new-arrivals': (context) => const NewArrivalsScreen(),  
 '/electronics-fest': (context) => const ElectronicsFestScreen(),
       
      },
    );
  }
}



