import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Alert/error_snackBar_message.dart';
import '../../../Utilities/Methods/Services/email_validation.dart';
import '../../../Utilities/Methods/Firebase/register_with_email.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/password_validator.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../Controllers/authentication_screens_controller.dart';
import '../Controllers/register_controller.dart';
import '../Models/Register Screen/register_email_textField.dart';
import '../Models/Register Screen/register_password_textField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final authenticationController = Get.find<AuthenticationScreensController>();
  final registerController = Get.find<RegisterController>();
  final networkController = Get.find<NetworkConnectionController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
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
                            'SIGN UP',
                            style: GoogleFonts.lobster(
                              fontSize: 40.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 25),
                          RegisterEmailTextField(),
                          const SizedBox(height: 25),
                          RegisterPasswordTextField(),
                          const SizedBox(height: 25),
                          PasswordValidator(screen: 'RegisterScreen',),
                          const SizedBox(height: 25),
                          ElevatedButton(
                            style: kSingInButtonStyle,
                            onPressed: (){
                              emailValidate();
                              if(registerController.usernameValid.value && registerController.passwordValid.value && networkController.deviceIsConnected.value){
                                authenticationController.toggleSpinner();
                                registerWithEmail();
                              }else if(registerController.username.value==''){
                                registerController.updateUsernameLabel('Please Provide A Username');
                              }else if(registerController.password.value==''){
                                registerController.updatePasswordLabel('Please Provide A Password');
                              }else if(!networkController.deviceIsConnected.value){
                                showErrorSnackBarMessage(
                                  message: 'Please Check Your Internet Connection',
                                  title: 'No Internet Connection',
                                );
                              }
                            },
                            child: const Text('Sing Up', style: TextStyle(fontSize: 18),),),
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
