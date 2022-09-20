import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../Controllers/login_controller.dart';

class LoginEmailTextField extends StatelessWidget {
   LoginEmailTextField({Key? key}) : super(key: key);

   final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> AutofillGroup(
          child: TextField(
          decoration: kTextFieldDecoration.copyWith(
            prefixIcon:
            const Icon(FontAwesomeIcons.envelope),
            hintText: 'Please Enter Your Email',
            labelText: (loginController.usernameLabel.value == '')
                ? null
                : loginController.usernameLabel.value,
            labelStyle: const TextStyle(
              color: Colors.red,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            loginController.updateUsernameLabel('');
            loginController.updateUsername(value);
          },
            autofillHints:  [AutofillHints.email],
            onEditingComplete: ()=> TextInput.finishAutofillContext(),
      ),
        ),
    );
  }
}
