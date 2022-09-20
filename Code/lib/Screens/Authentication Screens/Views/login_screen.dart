import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Alert/error_snackBar_message.dart';
import '../../../Utilities/Methods/Firebase/login_user.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../Controllers/authentication_screens_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controllers/login_controller.dart';
import '../Models/Login Screen/go_to_register.dart';
import '../Models/Login Screen/login_email_textField.dart';
import '../Models/Login Screen/login_password_textField.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

   final authenticationController = Get.find<AuthenticationScreensController>();
   final loginController = Get.find<LoginController>();
   final networkController = Get.find<NetworkConnectionController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: AppBar(),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: Container(
                  color: (authenticationController.isLoading.value)? Colors.grey.withOpacity(0.6) : null,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 35),
                          Text(
                            'SIGN IN',
                            style: GoogleFonts.lobster(
                              fontSize: 40.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 25),
                          LoginEmailTextField(),
                          const SizedBox(height: 25),
                          LoginPasswordTextField(),
                          const SizedBox(height: 40),
                          ElevatedButton(
                            style: kSingInButtonStyle,
                              onPressed: (){
                              loginController.checkUsernamePasswordEntered();
                              if(loginController.credentialEntered.value && networkController.deviceIsConnected.value){
                                authenticationController.toggleSpinner();
                                signInWithEmail(context);
                              }else if(!networkController.deviceIsConnected.value){
                                showErrorSnackBarMessage(
                                    message: 'Please Check Your Internet Connection',
                                    title: 'No Internet Connection',
                                );
                              }
                              },
                              child: const Text('Sing In', style: TextStyle(fontSize: 18),),),
                          const SizedBox(height: 40),
                          const GoToRegister(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (authenticationController.showSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
