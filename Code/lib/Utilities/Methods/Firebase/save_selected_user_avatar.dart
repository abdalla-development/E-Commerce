import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../Alert/error_snackBar_message.dart';

final loginScreenController = Get.find<LoginController>();

void saveSelectedUserAvatar() async{
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  File file = File(loginScreenController.userAvatarPath.value);

  try{
    await storage.ref('UsersAvatar/${loginScreenController.currentLoggedInUser.value}').putFile(file);
    showSuccessSnackBarMessage(
        message: 'Your Image Had been Saved Successfully',
        title: 'Uploading Successful'
    );
  }on firebase_core.FirebaseException catch(e){
    showErrorSnackBarMessage(
      title: 'Error Uploading Photo',
      message: e.toString(),
    );
  }
}