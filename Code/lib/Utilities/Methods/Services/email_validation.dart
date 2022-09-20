import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import '../../../Screens/Authentication Screens/Controllers/register_controller.dart';

final registration = Get.find<RegisterController>();

void emailValidate() {
  bool emailIsValid = false;
  emailIsValid = EmailValidator.validate(registration.username.value.toString());
  registration.updateLoginEmailIsValid(emailIsValid);
}