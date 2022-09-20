import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import '../../../Home Screen/Controllers/home_screen_controller.dart';
import '../../Controllers/user_account_screen_controller.dart';

class UserServicesAndSupports extends StatelessWidget {
   UserServicesAndSupports({Key? key}) : super(key: key);

   final homeController = Get.find<HomeController>();
   final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Services & Supports', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            FocusedMenuHolder(
              blurBackgroundColor: Colors.blueGrey[900],
              openWithTap: true,
              menuItems: [
                FocusedMenuItem(
                  onPressed: () {},
                  title: const Text('Select Language'),
                ),
                FocusedMenuItem(
                  onPressed: () {
                    homeController.updateUserLanguage('Arabic');
                  },
                  title: const Text('Arabic'),
                  trailingIcon: (homeController.userLanguage.value=='Arabic')? const Icon(FontAwesomeIcons.check, color: Colors.greenAccent) : null,
                ),
                FocusedMenuItem(
                  onPressed: () {
                    homeController.updateUserLanguage('English');
                  },
                  title: const Text('English'),
                  trailingIcon: (homeController.userLanguage.value=='English')? const Icon(FontAwesomeIcons.check, color: Colors.greenAccent) : null,
                ),
              ],
              onPressed: (){},
              child: const ListTile(
                leading: Icon(FontAwesomeIcons.angular),
                title: Text('Language'),
                trailing: Icon(FontAwesomeIcons.chevronRight),
              ),
            ),
            GestureDetector(
              onTap: (){
                userAccountController.updateScreenHasLeadingIcon(true);
                Get.toNamed('/PaymentScreen');
              },
              child: const ListTile(
                leading: Icon(FontAwesomeIcons.creditCard),
                title: Text('Payment Information'),
                trailing: Icon(FontAwesomeIcons.chevronRight),
              ),
            ),
            GestureDetector(
              onTap: (){
                userAccountController.updateScreenHasLeadingIcon(true);
                Get.toNamed('/ContactUsScreen');
              },
              child: const ListTile(
                leading: Icon(FontAwesomeIcons.envelopeCircleCheck),
                title: Text('Contact Us'),
                trailing: Icon(FontAwesomeIcons.chevronRight),
              ),
            ),
            GestureDetector(
              onTap: (){
                userAccountController.updateScreenHasLeadingIcon(true);
                Get.toNamed('/RateTheAppScreen');
              },
              child: const ListTile(
                leading: Icon(FontAwesomeIcons.heartCircleExclamation),
                title: Text('Rate The App'),
                trailing: Icon(FontAwesomeIcons.chevronRight),
              ),
            ),
            GestureDetector(
              onTap: (){
                Share.share('check out my website https://example.com');
              },
              child: const ListTile(
                leading: Icon(FontAwesomeIcons.shareNodes),
                title: Text('Share The App'),
                trailing: Icon(FontAwesomeIcons.chevronRight),
              ),
            ),
            GestureDetector(
              onTap: (){
                userAccountController.updateScreenHasLeadingIcon(true);
                Get.toNamed('/NotificationsSettingsScreen');
              },
              child: const ListTile(
                leading: Icon(FontAwesomeIcons.solidBell),
                title: Text('Notification Settings'),
                trailing: Icon(FontAwesomeIcons.chevronRight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
