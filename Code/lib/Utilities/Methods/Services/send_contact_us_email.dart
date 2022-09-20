import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:mailer/smtp_server/hotmail.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_account_screen_controller.dart';

final userAccountController = Get.find<UserAccountController>();
final login = Get.find<LoginController>();

void sendContactUsEmail() async{
  final Email email = Email(
    subject: userAccountController.contactUsMessageSubject.value,
    body: '${login.username.value}'
        '\n${userAccountController.contactUsMessageBody.value}',
    recipients: ['abdo_hu_90@hotmail.com.com'],
    isHTML: false,
  );

  await FlutterEmailSender.send(email);

  // Sending Mail From Inside The App using mailer

  // String emailSend = '';
  // String passwordSend = '';
  // final smtpServer = hotmail(emailSend, passwordSend);
  // final message = Message()
  // ..from = Address('abdo_hu_90@hotmail.com','Abdalla')
  // ..subject = contactUsController.messageTitle.value
  // ..text = '${homeScreen.userUsername.value}'
  //     '\n${contactUsController.messageBody.value}'
  // ..recipients = ['abdo_hu_90@hotmail.com']
  // ;
  //
  // try{
  //   await send(message, smtpServer);
  // } catch(e){}
}