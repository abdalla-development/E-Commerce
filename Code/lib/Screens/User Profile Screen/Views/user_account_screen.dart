import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Authentication Screens/Controllers/login_controller.dart';
import '../../Home Screen/Controllers/user_favorites_list_controller.dart';
import '../../Home Screen/Controllers/user_orders_controller.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../Controllers/user_account_screen_controller.dart';
import '../Models/Main Screen/user_account_information.dart';
import '../Models/Main Screen/user_info_card.dart';
import '../Models/Main Screen/user_services_and_supports.dart';

class UserAccountScreen extends StatelessWidget {
  UserAccountScreen({Key? key}) : super(key: key);

  final userAccountController = Get.find<UserAccountController>();
  final networkController = Get.find<NetworkConnectionController>();
  final login = Get.find<LoginController>();
  final storeController = Get.find<StoreScreenController>();
  final favoritesController = Get.find<UserFavoritesListController>();
  final order = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: userAccountController.hasBackIcon.value, onPressed: (){Get.back();}, isUserAccountScreen: true, title: ''),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: (networkController.deviceIsConnected.value || storeController.storeDataLoaded.value)?SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: (userAccountController.userLoggedIn.value)
                        ? Column(
                      children: [
                        UserInformationCard(),
                        UserAccountInformation(),
                        UserServicesAndSupports(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              minimumSize: const Size(150, 40),
                              primary: const Color(0xccFDAF75),
                            ),
                            onPressed: () async{
                              // await FirebaseAuth.instance.signOut();
                              // userAccountController.updateUserLoggedIn(false);
                              // login.clearLoginData();
                              // Get.offNamed('/LoginScreen');
                              order.getUserOnlineOrders();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(FontAwesomeIcons.powerOff),
                                SizedBox(width: 15),
                                Text(
                                  'Logout',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    )
                        : Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 200),
                          const Text(
                            'Sorry! But You Are Not Logged In',
                            style: TextStyle(
                                fontSize: 18, color: Color(0XD9413F42)),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Already Have An Account',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            style: kSingInButtonStyle,
                            onPressed: () {
                              Get.toNamed('/LoginScreen');
                            },
                            child: const Text('Sing In', style: TextStyle(fontSize: 18),),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Or',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed('/RegisterScreen');
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(fontSize: 18, color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ):const Center(
                child:  Text('No Internet Connection'),
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
