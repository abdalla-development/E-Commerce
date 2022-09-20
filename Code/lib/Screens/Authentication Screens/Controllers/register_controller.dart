import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RegisterController extends GetxController{
  final obscure = true.obs;
  final passwordValid = false.obs;
  final usernameValid = false.obs;
  final usernameLabel = ''.obs;
  final passwordLabel = ''.obs;
  final username = ''.obs;
  final password = ''.obs;
  final  passwordController = TextEditingController();

  void toggleRegisterObscure(){
    obscure.value = !obscure.value;
  }

  void updateUsername(String value){
    username.value = value;
  }

  void updateUsernameLabel(String value){
    usernameLabel.value = value;
  }

  void updatePassword(String value){
    password.value = value;
  }

  void updatePasswordLabel(String value){
    passwordLabel.value = value;
  }

  void togglePasswordIsValid(bool value){
    passwordValid.value = value;
  }

  void updateLoginEmailIsValid(bool value){
    usernameValid.value = value;
  }
}