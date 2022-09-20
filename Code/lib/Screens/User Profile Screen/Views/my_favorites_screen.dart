import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Home Screen/Controllers/user_favorites_list_controller.dart';
import '../Controllers/user_account_screen_controller.dart';

class MyFavoritesScreen extends StatelessWidget {
   MyFavoritesScreen({Key? key}) : super(key: key);

   final userAccountController = Get.find<UserAccountController>();
   final favorites = Get.find<UserFavoritesListController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'My Favorites'),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        (favorites.favorites.isNotEmpty)? SingleChildScrollView(
                          child: Column(
                            children: favorites.favorites,
                          ),
                        ) :
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('No Favorites Was Added'),
                          ],
                        ),
                        const SizedBox(height: 90),
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
