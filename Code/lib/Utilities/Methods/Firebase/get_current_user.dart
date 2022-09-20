import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../Alert/error_snackBar_message.dart';

String currentLoggedInUser = '';
final login = Get.find<LoginController>();
final userAccount = Get.find<UserAccountController>();
bool emailVerified = false;

void getCurrentUser() async {
  try {
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      currentLoggedInUser = currentUser.uid;
      login.updateCurrentLoggedInUser(currentLoggedInUser);
    }
    try{
      emailVerified = currentUser!.emailVerified;
      (emailVerified)? userAccount.updateEmailVerified(true) : null ;
    }catch(e){
      userAccount.updateEmailVerified(false);
    }
    print(emailVerified);
  } on FirebaseAuthException catch (e) {
    showErrorSnackBarMessage(
      message: e.toString(),
      title: 'Error',
    );
  }
}
