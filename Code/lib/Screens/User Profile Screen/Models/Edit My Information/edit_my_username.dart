import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/User Information/edit_username.dart';
import '../../Controllers/user_information_update_controller.dart';


class EditMyUsername extends StatelessWidget {
   EditMyUsername({Key? key}) : super(key: key);

   final userInfoUpdate = Get.find<UserInformationUpdateController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Username',
              style: TextStyle(fontSize: 22),
            ),
            IconButton(
              onPressed: () {
                editUsername(context);
              },
              icon: const Icon(FontAwesomeIcons.pen),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Obx(
              ()=> Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              userAccountController.userUsername.value,
              style: const TextStyle(
                  fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
