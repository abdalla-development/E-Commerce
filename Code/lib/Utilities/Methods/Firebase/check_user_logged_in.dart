import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';

final userAccountController = Get.find<UserAccountController>();

void checkUserLoggedIn() async{
  User? user = await FirebaseAuth.instance.currentUser;
  if (user != null) {
    userAccountController.updateUserLoggedIn(true);
  }else{
    userAccountController.updateUserLoggedIn(false);
  }
}