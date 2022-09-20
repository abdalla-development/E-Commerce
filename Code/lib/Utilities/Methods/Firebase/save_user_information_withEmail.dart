import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../Alert/error_snackBar_message.dart';

final userInfoController = Get.find<UserInformationScreenController>();
final userAccount = Get.find<UserAccountController>();
final CollectionReference users =
    FirebaseFirestore.instance.collection('Users');

void saveUserInformationEmail() async {
  final userInfo = <String, dynamic>{
    'First Name': userInfoController.firstName.value,
    'Last Name': userInfoController.lastName.value,
    'Username': userInfoController.username.value,
    'Gender': userInfoController.genderType.value,
    'Mobile Number': userInfoController.userMobileNumber.value,
    'City': userInfoController.userCity.value,
    'Email Verified': userAccount.userEmailVerified.value,
  };

  try {
    await users
        .doc(userInfoController.currentLoggedInUser.value)
        .set(userInfo)
        .onError((e, _) => showErrorSnackBarMessage(
        message: 'Sorry! Something Went Wrong',
        title: 'Saving Unsuccessful'))
        .then((value) => showSuccessSnackBarMessage(
        title: 'Saving Successfully',
        message: 'Your Information Has Being Added'));
    userInfoController.toggleLoadingSpinner();
    Get.toNamed('/HomeScreen');
  } catch (e) {
    showErrorSnackBarMessage(message: e.toString(), title: 'Saving Unsuccessful');
  }
}
