import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/Firebase/verify_currentUser_email.dart';
import '../../Controllers/user_account_screen_controller.dart';
import '../../Controllers/user_information_update_controller.dart';


class MyEmailVerification extends StatelessWidget {
   MyEmailVerification({Key? key}) : super(key: key);

   final userInfoUpdate = Get.find<UserInformationUpdateController>();
   final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Email Address',
              style: TextStyle(fontSize: 22),
            ),
            (userInfoUpdate.emailVerified.value)? const Text('Verified', style: TextStyle(color: Colors.lightGreen, fontSize: 18),) : GestureDetector(
              onTap: (){
                verifyCurrentUserEmail();
              },
              child: const Text('Verify', style: TextStyle(color: Colors.amber, fontSize: 18),),
            ),

          ],
        ),
        const SizedBox(height: 4),
        Obx(
              ()=> Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              userAccountController.userEmail.value,
              style: const TextStyle(
                  fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
