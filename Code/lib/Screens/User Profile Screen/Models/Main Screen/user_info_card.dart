import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/Firebase/upload_user_avatar.dart';
import '../../Controllers/user_account_screen_controller.dart';

class UserInformationCard extends StatelessWidget {
   UserInformationCard({Key? key}) : super(key: key);

   final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        decoration: BoxDecoration(
          color: const Color(0x4081CACF),
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipOval(
                  child: CircleAvatar(
                    radius: 70,
                    child: Image.network(
                      (userAccountController.userOnlineAvatar.value!='')?userAccountController.userOnlineAvatar.value:'https://www.seekpng.com/png/full/41-410093_circled-user-icon-user-profile-icon-png.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: IconButton(
                    onPressed: () {
                      uploadUserAvatar();
                    },
                    icon: const Icon(FontAwesomeIcons.pen),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text('Hello ${userAccountController.userFirstName.value}', style: const TextStyle(fontSize: 19),),
                const SizedBox(height: 8),
                Text(userAccountController.userCity.value, style: const TextStyle(fontSize: 18),),
                const SizedBox(height: 8),
                Text(userAccountController.userEmail.value, style: const TextStyle(fontSize: 16),),
                const SizedBox(height: 8),
                Text(userAccountController.userMobile.value, style: const TextStyle(fontSize: 18),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
