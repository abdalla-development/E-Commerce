import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/User Information/edit_last_name.dart';
import '../../Controllers/user_information_update_controller.dart';

class EditMyLastName extends StatelessWidget {
   EditMyLastName({Key? key}) : super(key: key);

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
              'Last Name',
              style: TextStyle(fontSize: 22),
            ),
            IconButton(
              onPressed: () {
                editLastName(context);
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
              userInfoUpdate.lastName.value,
              style: const TextStyle(
                  fontSize: 16, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}


