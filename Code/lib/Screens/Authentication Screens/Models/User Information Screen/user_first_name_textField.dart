import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../Controllers/user_information_controller.dart';

class UserFirstNameTextField extends StatelessWidget {
   UserFirstNameTextField({Key? key}) : super(key: key);

   final userInfoController = Get.find<UserInformationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.f),
          hintText: 'Please Enter Your First Name',
          labelText: (userInfoController.firstNameLabel.value == '')?null:userInfoController.firstNameLabel.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        onChanged: (value) {
          if (value!=''){
            userInfoController.updateFirstName(value);
            userInfoController.updateFirstNameLabel('');
          }
        },
      ),
    );
  }
}