import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../Controllers/register_controller.dart';

class RegisterPasswordTextField extends StatelessWidget {
   RegisterPasswordTextField({Key? key}) : super(key: key);

   final registerController = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> TextField(
        decoration: kTextFieldDecoration.copyWith(
          prefixIcon: const Icon(FontAwesomeIcons.lock),
          hintText: 'Please Enter A Password',
          suffix: GestureDetector(
            child: const Icon(Icons.visibility),
            onTap: () {
              registerController.toggleRegisterObscure();
            },
          ),
          labelText:(registerController.passwordLabel.value=='')? null : registerController.passwordLabel.value,
          labelStyle: const TextStyle(color: Colors.red),
        ),
        controller: registerController.passwordController,
        obscureText: registerController.obscure.value,
        onChanged: (value) {
          registerController.updatePassword(value);
          registerController.updatePasswordLabel('');
        },
      ),
    );
  }
}
