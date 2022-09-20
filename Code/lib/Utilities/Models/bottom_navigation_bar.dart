import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:get/get.dart';
import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import '../Configurations/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);

  final homeScreen = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return CircularBottomNavigation(
      iconsSize: 25,
      tabItems,
      controller: homeScreen.navigationController,
      barBackgroundColor: const Color(0xD981CACF),
      selectedCallback: (index) {
        if (index == 0) {
          homeScreen.updateBottomNavBarIndex(0);
          Get.offNamed('/HomeScreen');
        } else if (index == 1) {
          homeScreen.updateBottomNavBarIndex(1);
          Get.offNamed('/StoreScreen');
        } else if (index == 2) {
          homeScreen.updateBottomNavBarIndex(2);
          Get.offNamed('/CartScreen');
        }
        else if (index == 3) {
          homeScreen.updateBottomNavBarIndex(3);
          Get.offNamed('/UserAccountScreen');
        }
      },
    );
  }
}
