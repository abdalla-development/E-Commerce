import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/user_information_controller.dart';

class UserGenderSelection extends StatelessWidget {
   UserGenderSelection({Key? key}) : super(key: key);

   final userInfoController = Get.find<UserInformationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Gender: ',
              style: TextStyle(
                  fontFamily: 'Dela Gothic One',
                  fontSize: 15.0),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      'Male',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                      ),
                    ),
                    Checkbox(
                      activeColor:
                      const Color(0xFF0C1446),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10.0),
                      ),
                      value: userInfoController.maleGenderIsChecked.value,
                      onChanged: (bool? value) {
                        userInfoController.toggleGenderType();
                        userInfoController.updateGenderType('male');
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: [
                    const Text(
                      'Female',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20.0,
                      ),
                    ),
                    Checkbox(
                      activeColor:
                      const Color(0xFF0C1446),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(10.0),
                      ),
                      value: userInfoController.femaleGenderIsChecked.value,
                      onChanged: (bool? value) {
                        userInfoController.toggleGenderType();
                        userInfoController.updateGenderType('female');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
