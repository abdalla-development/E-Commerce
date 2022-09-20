import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_information_update_controller.dart';
import '../Alert/error_snackBar_message.dart';

final CollectionReference users =
    FirebaseFirestore.instance.collection('Users');
final userInfoUpdate = Get.find<UserInformationUpdateController>();
final userInfoController = Get.find<UserInformationScreenController>();
final userAccountController = Get.find<UserAccountController>();
final loginController = Get.find<LoginController>();

void updateUserInformation() async {
  final userInfo = <String, dynamic>{
    'First Name': userInfoUpdate.firstName.value,
    'Last Name': userInfoUpdate.lastName.value,
    'Username': userInfoUpdate.username.value,
    'Gender': userInfoController.genderType.value,
    'Mobile Number': userInfoUpdate.mobile.value,
    'City': userInfoController.userCity.value,
    'Email Verified': userAccountController.userEmailVerified.value,
  };

  try {
    users
        .doc(userInfoController.currentLoggedInUser.value)
        .update(userInfo)
        .then((value) => showSuccessSnackBarMessage(
            message: 'Your Information had Been Updated',
            title: 'Update Successful'));
    userAccountController.loadUserInformation(
        firstName: userInfoUpdate.firstName.value,
        lastName: userInfoUpdate.lastName.value,
        email: loginController.username.value,
        mobile: userInfoUpdate.mobile.value,
        city: userInfoController.userCity.value,
        username: userInfoUpdate.username.value,
        emailVerified: userAccountController.userEmailVerified.value,
    );
    Get.toNamed('/UserAccountScreen');
  } catch (e) {
    showErrorSnackBarMessage(
        message: e.toString(), title: 'Update Unsuccessful');
  }
}
