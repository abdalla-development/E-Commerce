import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final obscure = true.obs;
  final usernameLabel = ''.obs;
  final passwordLabel = ''.obs;
  final username = ''.obs;
  final password = ''.obs;
  final credentialEntered = false.obs;
  final emailValid = false.obs;
  final currentLoggedInUser = ''.obs;
  final userAvatarPath = ''.obs;

  void toggleLoginObscure(){
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

  void checkUsernamePasswordEntered(){
    emailValid.value = EmailValidator.validate(username.value);
    if(password.value!='' && username.value!='' && emailValid.value){
      credentialEntered.value = true;
    }else if(username.value==''){
      credentialEntered.value = false;
      usernameLabel.value = 'You Need To provide A Username!';
    }else if(password.value==''){
      credentialEntered.value = false;
      passwordLabel.value = 'You Need To provide A Password!';
    }else if(!emailValid.value){
      credentialEntered.value = false;
      usernameLabel.value = 'You Need To provide A Valid Username!';
    }
  }

  void updateCurrentLoggedInUser(String value) {
    currentLoggedInUser.value = value;
  }

  void loadUserAvatarPath(String value) {
    userAvatarPath.value = value;
  }

  void clearLoginData(){
    username.value = '';
    password.value = '';
  }
}