import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/user_account_screen_controller.dart';
import '../Controllers/user_ratings_controller.dart';
import '../Models/Rate The App/did_you_like_the_app.dart';
import '../Models/Rate The App/how_were_you_satisfied.dart';
import '../Models/Rate The App/was_the_app_easy_to_use.dart';

class RateTheAppScreen extends StatelessWidget {
   RateTheAppScreen({Key? key}) : super(key: key);

   final ratingController = Get.find<UsersRatingController>();
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
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'Users Rating'),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          DidYouLikeTheApp(),
                          const SizedBox(height: 10,),
                          WasTheAppEasyToUse(),
                          const SizedBox(height: 8,),
                          HowWereYouSatisfied(),
                        ],
                      ),
                    ],
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
