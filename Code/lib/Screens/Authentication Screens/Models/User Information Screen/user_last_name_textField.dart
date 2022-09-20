import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../Controllers/user_information_controller.dart';


class UserLastNameTextField extends StatelessWidget {
   UserLastNameTextField({Key? key}) : super(key: key);

   final userInfoController = Get.find<UserInformationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.l),
          hintText: 'Please Enter Your Last Name',
          labelText: (userInfoController.lastNameLabel.value == '')?null:userInfoController.lastNameLabel.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        onChanged: (value) {
          if (value!=''){
            userInfoController.updateLastName(value);
            userInfoController.updateLastNameLabel('');
          }
        },
      ),
    );
  }
}