import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_screen_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/authentication_screens_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/Cart Screen/Controllers/cart_screen_controller.dart';
import '../../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import '../../../Screens/Home Screen/Controllers/user_favorites_list_controller.dart';
import '../../../Screens/Home Screen/Controllers/user_orders_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_information_update_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_payment_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_shipping_addresses_controller.dart';
import '../Alert/error_snackBar_message.dart';
import 'get_current_user.dart';

final login = Get.find<LoginController>();
final userInfo = Get.find<UserInformationScreenController>();
final userInfoUpdate = Get.find<UserInformationUpdateController>();
final userAccount = Get.find<UserAccountController>();
final home = Get.find<HomeController>();
final shipping = Get.find<UserShippingAddressesController>();
final paymentController = Get.find<UserPaymentInformationController>();
final authenticationController = Get.find<AuthenticationScreensController>();
final favoritesController = Get.find<UserFavoritesListController>();
final cartController = Get.find<CartController>();
final orderController = Get.find<UserOrdersController>();

void signInWithEmail(BuildContext context) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: login.username.value, password: login.password.value);
    getCurrentUser();
    final snapShot = await FirebaseFirestore.instance.collection('Users')
        .doc(login.currentLoggedInUser.value).get();

    userInfo.updateCurrentLoggedInUser(login.currentLoggedInUser.value);
    login.updateCurrentLoggedInUser(login.currentLoggedInUser.value);
    userAccount.updateUserLoggedIn(true);
    userInfo.updateUserEmailAddress(login.username.value);
    shipping.loadUserShippingAddresses();
    paymentController.loadUserPaymentInformation();
    userAccount.updateUserOnlineAvatar(login.currentLoggedInUser.value);
    favoritesController.getOnlineUserFavoritesList();
    cartController.getUserOnlineCart();
    authenticationController.toggleUserLoggedIn();
    orderController.getUserOnlineOrders();

    if (snapShot.exists) {
      userAccount.loadUserInformation(
          email: login.username.value,
          mobile: snapShot.data()!['Mobile Number'],
          lastName: snapShot.data()!['Last Name'],
          firstName: snapShot.data()!['First Name'],
          city: snapShot.data()!['City'],
          username: snapShot.data()!['Username'],
          emailVerified: userAccount.userEmailVerified.value,
      );
      userInfoUpdate.loadUserData(
          first: snapShot.data()!['First Name'],
          last: snapShot.data()!['Last Name'],
          user: snapShot.data()!['Username'],
          number: snapShot.data()!['Mobile Number'],
          userEmail: login.username.value);

      favoritesController.getOnlineUserFavoritesList();
      homeController.updateScreenHasLeadingIcon(false);
      Navigator.pop(context);
      // home.updateBottomNavBarIndex(0);
      // Get.off('/HomeScreen');
    } else {
      Get.off('/UserInformationScreen');
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showErrorSnackBarMessage(
          message: 'Sorry! Try To Register First', title: 'User Not Found');
      Get.toNamed('/RegisterScreen');
    } else if (e.code == 'wrong-password') {
      showErrorSnackBarMessage(
          message: 'Sorry! The Password You Entered Wrong Password',
          title: 'Invalid Credentials');
    }
  }
  authenticationController.toggleSpinner();
}
