import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/notifications_settings_controller.dart';
import '../Controllers/user_account_screen_controller.dart';

class NotificationsSettingsScreen extends StatelessWidget {
   NotificationsSettingsScreen({Key? key}) : super(key: key);

   final userAccountController = Get.find<UserAccountController>();
   final notificationsController = Get.find<NotificationsSettingsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'Notifications'),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    ListTile(
                      leading: (notificationsController.dealsNotificationsOn.value)? const Icon(FontAwesomeIcons.bell) : const Icon(FontAwesomeIcons.bellSlash),
                      title: const Text('New Deals Notifications'),
                      trailing: CupertinoSwitch(
                        onChanged: (bool value) {
                          notificationsController.toggleNewDealsNotification(value);
                        },
                        value: notificationsController.dealsNotificationsOn.value,
                      ),
                    ),
                    ListTile(
                      leading: (notificationsController.newArrival.value)? const Icon(FontAwesomeIcons.bell) : const Icon(FontAwesomeIcons.bellSlash),
                      title: const Text('New Arrival Notifications'),
                      trailing: CupertinoSwitch(
                        onChanged: (bool value) {
                          notificationsController.toggleNewArrivalNotification(value);
                        },
                        value: notificationsController.newArrival.value,
                      ),
                    ),
                  ],
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
