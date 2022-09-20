import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Services/send_contact_us_email.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/user_account_screen_controller.dart';

class ContactUsScreen extends StatelessWidget {
   ContactUsScreen({Key? key}) : super(key: key);

   final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'Contact Us'),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Message Title',
                              labelText: (userAccountController.contactUsMessageSubjectLabel.value!='')? userAccountController.contactUsMessageSubjectLabel.value : null,
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              userAccountController.updateContactUsSubject(value);
                              userAccountController.updateContactUsSubjectLabel('');
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Message',
                              labelText: (userAccountController.contactUsMessageBodyLabel.value!='')? userAccountController.contactUsMessageBodyLabel.value : null,
                              labelStyle: const TextStyle(color: Colors.red),
                            ),
                            minLines: 12,
                            maxLines: 20,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              userAccountController.updateContactUsBody(value);
                              userAccountController.updateContactUsBodyLabel('');
                            },
                          ),
                          const SizedBox(height: 20,),
                          ElevatedButton(
                            style: kSingInButtonStyle,
                            onPressed: () {
                              if(userAccountController.contactUsMessageSubject.value!='' && userAccountController.contactUsMessageBody.value!=''){
                                sendContactUsEmail();
                              }else if(userAccountController.contactUsMessageSubject.value==''){
                                userAccountController.updateContactUsSubjectLabel('You Need To Provide A Message Subject');
                              }else if(userAccountController.contactUsMessageBody.value==''){
                                userAccountController.updateContactUsBodyLabel('You Need To Provide A Message Body');
                              }
                            },
                            child: const Text('Send Message'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (userAccountController.showSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
