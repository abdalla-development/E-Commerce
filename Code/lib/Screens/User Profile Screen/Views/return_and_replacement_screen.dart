import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/user_account_screen_controller.dart';

class ReturnAndReplacementScreen extends StatelessWidget {
   ReturnAndReplacementScreen({Key? key}) : super(key: key);

   final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'Replacement'),
          body: Container(
            color: kAppBodyBackgroundColor,
            child: SafeArea(
              child: Column(),
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
    );
  }
}
