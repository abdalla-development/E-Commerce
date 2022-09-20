import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/Authentication Screens/Views/login_screen.dart';
import 'Screens/Authentication Screens/Views/register_screen.dart';
import 'Screens/Authentication Screens/Views/user_information_screen.dart';
import 'Screens/Cart Screen/Views/cart_screen.dart';
import 'Screens/Cart Screen/Views/confirm_order_screen.dart';
import 'Screens/Home Screen/Views/home_screen.dart';
import 'Screens/Item Details Screen/Views/item_details_screen.dart';
import 'Screens/Splash Screen/Bindings/splash_screen_binding.dart';
import 'Screens/Splash Screen/Views/splash_screen.dart';
import 'Screens/Store Screen/Views/store_screen.dart';
import 'Screens/User Profile Screen/Views/contact_us_screen.dart';
import 'Screens/User Profile Screen/Views/my_favorites_screen.dart';
import 'Screens/User Profile Screen/Views/my_information_screen.dart';
import 'Screens/User Profile Screen/Views/my_orders_screen.dart';
import 'Screens/User Profile Screen/Views/notifications_settings_screen.dart';
import 'Screens/User Profile Screen/Views/order_item_details_screen.dart';
import 'Screens/User Profile Screen/Views/payment_screen.dart';
import 'Screens/User Profile Screen/Views/rate_the_app_screen.dart';
import 'Screens/User Profile Screen/Views/return_and_replacement_screen.dart';
import 'Screens/User Profile Screen/Views/shipping_addresses_screen.dart';
import 'Screens/User Profile Screen/Views/user_account_screen.dart';
import 'package:get/get.dart';


void main() async{

  // SplashScreenBinding().dependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  AwesomeNotifications().initialize(
      'resource://drawable/res_app_icon',
      [
        NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });


  runApp(const ShoppingApp());
}

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: const Color(0xCC81CACF),
        ),
      ),
      initialBinding: SplashScreenBinding(),
      initialRoute: '/SplashScreen',
        getPages: [
          GetPage(name: '/SplashScreen', page: ()=>  const SplashScreen()),
          GetPage(name: '/HomeScreen', page: ()=>  HomeScreen()),
          GetPage(name: '/CartScreen', page: ()=>  CartScreen()),
          GetPage(name: '/UserAccountScreen', page: ()=>  UserAccountScreen()),
          GetPage(name: '/StoreScreen', page: ()=>  StoreScreen()),
          GetPage(name: '/ItemDetailsScreen', page: ()=>  ItemDetailsScreen()),
          GetPage(name: '/LoginScreen', page: ()=>  LoginScreen()),
          GetPage(name: '/RegisterScreen', page: ()=>  RegisterScreen()),
          GetPage(name: '/UserInformationScreen', page: ()=>  UserInformationScreen()),
          GetPage(name: '/ShippingAddressesScreen', page: ()=>  ShippingAddressesScreen()),
          GetPage(name: '/MyOrdersScreen', page: ()=>  MyOrdersScreen()),
          GetPage(name: '/MyFavoritesScreen', page: ()=>  MyFavoritesScreen()),
          GetPage(name: '/ReturnAndReplacementScreen', page: ()=>  ReturnAndReplacementScreen()),
          GetPage(name: '/PaymentScreen', page: ()=>  PaymentScreen()),
          GetPage(name: '/MyInformationScreen', page: ()=>  MyInformationScreen()),
          GetPage(name: '/ContactUsScreen', page: ()=>  ContactUsScreen()),
          GetPage(name: '/RateTheAppScreen', page: ()=>  RateTheAppScreen()),
          GetPage(name: '/NotificationsSettingsScreen', page: ()=>  NotificationsSettingsScreen()),
          GetPage(name: '/ConfirmOrderScreen', page: ()=>  ConfirmOrderScreen()),
          GetPage(name: '/OrderItemDetailsScreen', page: ()=>  OrderItemDetailsScreen()),
        ],
    );
  }
}

    // Short Description Colors Description ImageUrl Name Price Quantity Sizes One Size

// Colors Description ImageUrl Name Price Quantity  Short Description Sizes Discount

