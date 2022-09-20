import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_information_update_controller.dart';
import '../../Configurations/constants.dart';
import 'package:get/get.dart';

final userAccountController = Get.find<UserAccountController>();
final userInfoUpdate = Get.find<UserInformationUpdateController>();
String newUsername = '';

Future editUsername(BuildContext context){
  return showDialog(
    context: context,
    builder: (context)=> AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      title: const Text('Username'),
      content: Obx(
        ()=> TextField(
          decoration: kTextFieldDecoration.copyWith(
            prefixIcon: const Icon(FontAwesomeIcons.u),
            hintText: userAccountController.userUsername.value,
            labelText: (userInfoUpdate.usernameLabel.value!='')? userInfoUpdate.usernameLabel.value : null,
            labelStyle: const TextStyle(color: Colors.red),
          ),
          onChanged: (value) {
            newUsername = value;
            userInfoUpdate.updateUsernameLabel('');
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
            if(newUsername!=''){
              userInfoUpdate.updateUsername(newUsername);
              Navigator.pop(context);
            }else{
              userInfoUpdate.updateUsernameLabel('Enter Updated Username');
            }
          },
          child: const Text('Ok'),),
      ],
    ),
  );
}