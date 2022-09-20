import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../../Utilities/Methods/Alert/error_snackBar_message.dart';

final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

class UserAccountController extends GetxController {

  final showSpinner = false.obs;
  final hasBackIcon = false.obs;
  final userLoggedIn = false.obs;
  final userFirstName = ''.obs;
  final userLastName = ''.obs;
  final userEmail = ''.obs;
  final userEmailVerified = false.obs;
  final userMobile = ''.obs;
  final userCity = ''.obs;
  final userUsername = ''.obs;
  final userPaymentsInformation = {}.obs;
  List<Widget> userPaymentInformation = [];
  final contactUsMessageSubject = ''.obs;
  final contactUsMessageSubjectLabel = ''.obs;
  final contactUsMessageBody = ''.obs;
  final contactUsMessageBodyLabel = ''.obs;
  final userOrderID = ''.obs;
  final userOnlineAvatar = ''.obs;

  void toggleSpinner() {
    showSpinner.value = !showSpinner.value;
  }

  void updateScreenHasLeadingIcon(bool value){
    hasBackIcon.value = value;
  }

  void updateUserLoggedIn(bool value) {
    userLoggedIn.value = value;
  }

  void loadUserInformation(
      {required String firstName,
      required String lastName,
      required String email,
      required String mobile,
      required String city,
      required String username,
      required bool emailVerified}) {
    userFirstName.value = firstName;
    userLastName.value = lastName;
    userEmail.value = email;
    userMobile.value = mobile;
    userCity.value = city;
    userUsername.value = username;
    userEmailVerified.value = emailVerified;
  }

  void updateEmailVerified(bool value) {
    userEmailVerified.value = value;
  }

  void updateContactUsSubject(String value){
    contactUsMessageSubject.value = value;
  }

  void updateContactUsSubjectLabel(String value){
    contactUsMessageSubjectLabel.value = value;
  }

  void updateContactUsBody(String value){
    contactUsMessageBody.value = value;
  }

  void updateContactUsBodyLabel(String value){
    contactUsMessageBodyLabel.value = value;
  }

  void updateUserOrderID(String value){
    userOrderID.value = value;
  }

  void updateUserOnlineAvatar(String userId) async{
    try{
      userOnlineAvatar.value = await storage.ref('UsersAvatar/$userId').getDownloadURL();
    }on FirebaseException catch (e){
      showErrorSnackBarMessage(
          message: e.toString(),
          title: 'Error Loading Avatar',
      );
    }
  }
}
