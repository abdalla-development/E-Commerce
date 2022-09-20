import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/authentication_screens_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/register_controller.dart';
import '../Alert/error_snackBar_message.dart';

final registerMethod = Get.find<RegisterController>();
final authenticationController = Get.find<AuthenticationScreensController>();

void registerWithEmail() async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: registerMethod.username.value,
            password: registerMethod.password.value);
    showSuccessSnackBarMessage(
        message: 'You Account Has Being Created',
        title: 'Registration Successfully');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      showErrorSnackBarMessage(
          message: 'Sorry! But The Email Already Exists Try To Login Instead',
          title: 'Registration Unsuccessful');
    }
  } catch (e) {
    showErrorSnackBarMessage(
        message: e.toString(),
        title: 'Registration Unsuccessful');
  }
  authenticationController.toggleSpinner();
  Get.offNamed('/LoginScreen');
}
