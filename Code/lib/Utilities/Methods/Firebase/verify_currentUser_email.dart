import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../Alert/error_snackBar_message.dart';

User? user = FirebaseAuth.instance.currentUser;

void verifyCurrentUserEmail() async{

  // settingsController.toggleLoadingSpinner();
  try{
    await user?.sendEmailVerification();
    showSuccessSnackBarMessage(
        message: 'A Verification Email Had Been Sent',
        title: 'Successful',
    );
  }catch(e){
    showErrorSnackBarMessage(
        message: 'Sorry We Could Not Send A Verification Email Had Been Sent',
        title: 'Error',
    );
  }
  // settingsController.toggleLoadingSpinner();
}