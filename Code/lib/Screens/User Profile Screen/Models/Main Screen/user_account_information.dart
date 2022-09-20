import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Controllers/user_account_screen_controller.dart';

class UserAccountInformation extends StatelessWidget {
   UserAccountInformation({Key? key}) : super(key: key);

   final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Text('Account Information', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          GestureDetector(
            onTap: (){
              userAccountController.updateScreenHasLeadingIcon(true);
              Get.toNamed('/MyInformationScreen');
            },
            child: const ListTile(
              leading: Icon(FontAwesomeIcons.userShield),
              title: Text('My Information'),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            ),
          ),
          GestureDetector(
            onTap: (){
              userAccountController.updateScreenHasLeadingIcon(true);
              Get.toNamed('/ShippingAddressesScreen');
            },
            child: const ListTile(
              leading: Icon(FontAwesomeIcons.truckFast),
              title: Text('Shipping Information'),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            ),
          ),
          GestureDetector(
            onTap: (){
              userAccountController.updateScreenHasLeadingIcon(true);
              Get.toNamed('/MyOrdersScreen');
            },
            child: const ListTile(
              leading: Icon(FontAwesomeIcons.boxOpen),
              title: Text('My Orders'),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            ),
          ),
          GestureDetector(
            onTap: (){
              userAccountController.updateScreenHasLeadingIcon(true);
              Get.toNamed('/MyFavoritesScreen');
            },
            child: const ListTile(
              leading: Icon(FontAwesomeIcons.gratipay),
              title: Text('My Favourites'),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            ),
          ),
          GestureDetector(
            onTap: (){
              userAccountController.updateScreenHasLeadingIcon(true);
              Get.toNamed('/ReturnAndReplacementScreen');
            },
            child: const ListTile(
              leading: Icon(FontAwesomeIcons.warehouse),
              title: Text('Returns & Replacements'),
              trailing: Icon(FontAwesomeIcons.chevronRight),
            ),
          ),
        ],
      ),
    );
  }
}
