import 'package:get/get.dart';

class AuthenticationScreensController extends GetxController{
  final showSpinner = false.obs;
  final userLoggedIn = false.obs;
  final isLoading  = false.obs;

  void toggleSpinner(){
    showSpinner.value = !showSpinner.value;
    isLoading.value = !isLoading.value;
  }

  void toggleLoginObscure(){}

  void toggleUserLoggedIn(){
    userLoggedIn.value = !userLoggedIn.value;
  }
}