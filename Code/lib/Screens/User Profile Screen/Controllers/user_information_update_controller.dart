import 'package:get/get.dart';

class UserInformationUpdateController extends GetxController{

  final firstName = ''.obs;
  final firstNameLabel = ''.obs;
  final lastName = ''.obs;
  final lastNameLabel = ''.obs;
  final username = ''.obs;
  final usernameLabel = ''.obs;
  final mobile = ''.obs;
  final mobileLabel = ''.obs;
  final email = ''.obs;
  final emailVerified = false.obs;

  void updateFirstName(String value){
    firstName.value = value;
  }

  void updateFirstNameLabel(String value){
    firstNameLabel.value = value;
  }

  void updateLastName(String value){
    lastName.value = value;
  }

  void updateLastNameLabel(String value){
    lastNameLabel.value = value;
  }

  void updateUsername(String value){
    username.value = value;
  }

  void updateUsernameLabel(String value){
    usernameLabel.value = value;
  }

  void updateMobile(String value){
    mobile.value = value;
  }

  void updateMobileLabel(String value){
    mobileLabel.value = value;
  }

  void loadUserData({required String first, required String last, required String user, required String number, required String userEmail}){
    firstName.value = first;
    lastName.value = last;
    username.value = user;
    mobile.value = number;
    email.value = userEmail;
  }
}