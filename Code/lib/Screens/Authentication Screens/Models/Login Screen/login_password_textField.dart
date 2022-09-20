import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../Controllers/login_controller.dart';

class LoginPasswordTextField extends StatelessWidget {
  LoginPasswordTextField({Key? key}) : super(key: key);

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> AutofillGroup(
            child: TextField(
              decoration: kTextFieldDecoration.copyWith(
                prefixIcon: const Icon(FontAwesomeIcons.lock),
                hintText: 'Please Enter A Password',
                suffix: GestureDetector(
                  child: const Icon(Icons.visibility),
                  onTap: () {
                    loginController.toggleLoginObscure();
                  },
                ),
                labelText: (loginController.passwordLabel.value == '')
                    ? null
                    : loginController.passwordLabel.value,
                labelStyle: const TextStyle(
                  color: Colors.red,
                ),
              ),
              obscureText: loginController.obscure.value,
              onChanged: (value) {
                loginController.updatePasswordLabel('');
                loginController.updatePassword(value);
              },
              autofillHints: [AutofillHints.password],
              onEditingComplete: ()=> TextInput.finishAutofillContext(),
            ),
          ),
    );
  }
}
