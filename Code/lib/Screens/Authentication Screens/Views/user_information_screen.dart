import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Firebase/save_user_information_withEmail.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../User Profile Screen/Controllers/user_information_update_controller.dart';
import '../Controllers/authentication_screens_controller.dart';
import '../Controllers/user_information_controller.dart';
import '../Models/User Information Screen/user_city_textField.dart';
import '../Models/User Information Screen/user_first_name_textField.dart';
import '../Models/User Information Screen/user_gender_selection.dart';
import '../Models/User Information Screen/user_last_name_textField.dart';
import '../Models/User Information Screen/user_mobile_number_textField.dart';
import '../Models/User Information Screen/user_username_textField.dart';

class UserInformationScreen extends StatelessWidget {
   UserInformationScreen({Key? key}) : super(key: key);

   final userInfoController = Get.find<UserInformationScreenController>();
   final authenticationController = Get.find<AuthenticationScreensController>();
   final userInfoUpdate = Get.find<UserInformationUpdateController>();
   final userAccount = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(),
          body: Container(
            color: kAppBodyBackgroundColor,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 35),
                      Text(
                        'User Information',
                        style: GoogleFonts.lobster(
                          fontSize: 40.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 25),
                      UserFirstNameTextField(),
                      const SizedBox(height: 25),
                      UserLastNameTextField(),
                      const SizedBox(height: 25),
                      UserCityTextField(),
                      const SizedBox(height: 25),
                      UserUsernameTextField(),
                      const SizedBox(height: 25),
                      UserMobileNumberTextField(),
                      const SizedBox(height: 25),
                      UserGenderSelection(),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: kSingInButtonStyle,
                        onPressed: () async {
                          userInfoController.checkInputsValid();
                          if(userInfoController.inputsValid.value){
                            saveUserInformationEmail();
                            userAccount.loadUserInformation(email: userInfoController.userEmail.value, mobile: userInfoController.userMobileNumber.value, lastName: userInfoController.lastName.value, firstName: userInfoController.firstName.value, city: userInfoController.userCity.value, username:  userInfoController.username.value, emailVerified: false);
                            userInfoUpdate.loadUserData(first: userInfoController.firstName.value, last: userInfoController.lastName.value, user: userInfoController.username.value, number: userInfoController.userMobileNumber.value, userEmail: userInfoController.userEmail.value);
                          }
                        },
                        child: const Text(
                          'Save',
                        ),
                      ),
                      const SizedBox(height: 65),
                    ],
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
    );
  }
}
