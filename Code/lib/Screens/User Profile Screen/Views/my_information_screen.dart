import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/User Information/update_user_information.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/user_account_screen_controller.dart';
import '../Controllers/user_information_update_controller.dart';
import '../Models/Edit My Information/edit_my_first_name.dart';
import '../Models/Edit My Information/edit_my_last_name.dart';
import '../Models/Edit My Information/edit_my_mobile_number.dart';
import '../Models/Edit My Information/edit_my_username.dart';
import '../Models/Edit My Information/my_email_verification.dart';

class MyInformationScreen extends StatelessWidget {
  MyInformationScreen({Key? key}) : super(key: key);

  final userInfoUpdate = Get.find<UserInformationUpdateController>();
  final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'My Information'),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              EditMyFirstName(),
                              const SizedBox(height: 4),
                              const Divider(
                                thickness: 2.5,
                                color: Colors.blueGrey,
                              ),
                              EditMyLastName(),
                              const SizedBox(height: 4),
                              const Divider(
                                thickness: 2.5,
                                color: Colors.blueGrey,
                              ),
                              // const SizedBox(height: 4),
                              EditMyUsername(),
                              const Divider(
                                thickness: 2.5,
                                color: Colors.blueGrey,
                              ),
                              const SizedBox(height: 4),
                              MyEmailVerification(),
                              const Divider(
                                thickness: 2.5,
                                color: Colors.blueGrey,
                              ),
                              const SizedBox(height: 4),
                              EditMyMobileNumber(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          style: kSingInButtonStyle,
                          onPressed: () {
                            updateUserInformation();
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
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
          (userAccountController.showSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
