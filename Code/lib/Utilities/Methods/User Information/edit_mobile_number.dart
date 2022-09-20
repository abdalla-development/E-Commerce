import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_information_update_controller.dart';
import '../../Configurations/constants.dart';

final userAccountController = Get.find<UserAccountController>();
final userInfoUpdate = Get.find<UserInformationUpdateController>();
String newMobileNumber = '';

Future editMobileNumber(BuildContext context){
  return showDialog(
    context: context,
    builder: (context)=> AlertDialog(
      title: const Text('Mobile Number'),
      content: Obx(
          ()=> TextField(
          decoration: kTextFieldDecoration.copyWith(
            prefixIcon: const Icon(FontAwesomeIcons.mobile),
            hintText: userAccountController.userMobile.value,
            labelText: (userInfoUpdate.mobileLabel.value!='')? userInfoUpdate.mobileLabel.value : null,
            labelStyle: const TextStyle(color: Colors.red),
          ),
          onChanged: (value) {
            newMobileNumber = value;
            userInfoUpdate.updateMobileLabel('');
          },
          keyboardType: TextInputType.number,
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
            if(newMobileNumber!=''){
              userInfoUpdate.updateMobile(newMobileNumber);
              Navigator.pop(context);
            }else{
              userInfoUpdate.updateMobileLabel('Enter Updated Mobile Number');
            }
          },
          child: const Text('Ok'),),
      ],
    ),
  );
}