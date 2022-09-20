import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../Controllers/user_information_controller.dart';


class UserMobileNumberTextField extends StatelessWidget {
   UserMobileNumberTextField({Key? key}) : super(key: key);

   final userInfoController = Get.find<UserInformationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.mobile),
          hintText: 'Please Enter Your Mobile Number',
          labelText: (userInfoController.userMobileLabel.value == '')?null:userInfoController.userMobileLabel.value,
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        onChanged: (value) {
          if (value!=''){
            userInfoController.updateUserMobileNumber(value);
            userInfoController.updateUserMobileLabel('');
          }
        },
        keyboardType: TextInputType.number,
      ),
    );
  }
}
