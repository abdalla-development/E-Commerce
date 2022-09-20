import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../Controllers/register_controller.dart';


class RegisterEmailTextField extends StatelessWidget {
   RegisterEmailTextField({Key? key}) : super(key: key);

   final registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.envelope),
          hintText: 'Please Enter Your Email',
          labelText: (registerController.usernameLabel.value=='')
              ? null
              : registerController.usernameLabel.value,
          labelStyle: const TextStyle(color: Colors.red),
        ),
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          registerController.updateUsernameLabel('');
          registerController.updateUsername(value);
        },
      ),
    );
  }
}