import 'package:ecoshop/Auth/login_screen.dart';
import 'package:ecoshop/screens/banner_sales_screens/mega_sale_screen.dart';
import 'package:ecoshop/screens/category_screen.dart';
import 'package:ecoshop/screens/main_navigation.dart';
import 'package:ecoshop/screens/search_screen.dart';
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
import 'screens/flash_sale_screen.dart';
import 'screens/banner_sales_screens/new_arrivals_screen.dart';
import 'screens/banner_sales_screens/electronics_fest_screen.dart';
import 'Auth/user/edit_profile_screen.dart';

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



