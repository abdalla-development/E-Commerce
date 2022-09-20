import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_information_update_controller.dart';
import '../../Configurations/constants.dart';
import 'package:get/get.dart';

final userAccountController = Get.find<UserAccountController>();
final userInfoUpdate = Get.find<UserInformationUpdateController>();
String newFirstName = '';

Future editFirstName(BuildContext context){
  return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32.0),
          ),
        ),
        title: const Text('First Name'),
        content: Obx(
            ()=> TextField(
            decoration: kTextFieldDecoration.copyWith(
              prefixIcon: const Icon(FontAwesomeIcons.f),
              hintText: userAccountController.userFirstName.value,
              labelText: (userInfoUpdate.firstNameLabel.value!='')? userInfoUpdate.firstNameLabel.value : null,
              labelStyle: const TextStyle(color: Colors.red),
            ),
            onChanged: (value) {
              userInfoUpdate.updateFirstNameLabel('');
              newFirstName = value;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text('Cancel'),),
          TextButton(
            onPressed: (){
              if(newFirstName!=''){
                userInfoUpdate.updateFirstName(newFirstName);
                Navigator.pop(context);
              }else{
                userInfoUpdate.updateFirstNameLabel('Enter Updated First Name');
              }
            },
            child: const Text('Ok'),),
        ],
      ),
  );
}