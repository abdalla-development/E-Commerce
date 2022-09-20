import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_information_update_controller.dart';
import '../../Configurations/constants.dart';
import 'package:get/get.dart';

final userAccountController = Get.find<UserAccountController>();
final userInfoUpdate = Get.find<UserInformationUpdateController>();
String newLastName = '';

Future editLastName(BuildContext context){
  return showDialog(
    context: context,
    builder: (context)=> AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      title: const Text('Last Name'),
      content: Obx(
          ()=> TextField(
          decoration: kTextFieldDecoration.copyWith(
            prefixIcon: const Icon(FontAwesomeIcons.l),
            hintText: userAccountController.userLastName.value,
            labelText: (userInfoUpdate.lastNameLabel.value!='')? userInfoUpdate.lastNameLabel.value : null,
            labelStyle: const TextStyle(color: Colors.red),
          ),
          onChanged: (value) {
            userInfoUpdate.updateLastNameLabel('');
            newLastName = value;
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
            if(newLastName!=''){
              userInfoUpdate.updateLastName(newLastName);
              Navigator.pop(context);
            }else{
              userInfoUpdate.updateLastNameLabel('Enter Updated Last Name');
            }
          },
          child: const Text('Ok'),),
      ],
    ),
  );
}