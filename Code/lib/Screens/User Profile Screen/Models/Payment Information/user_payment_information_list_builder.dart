import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/Payement/delete_user_payment_card.dart';
import '../../../../Utilities/Methods/Payement/edit_user_payment_card.dart';
import '../../../../Utilities/Methods/Payement/set_card_as_default.dart';
import '../../Controllers/user_payment_information_controller.dart';

class UserPaymentInformationListBuilder extends StatelessWidget {
   UserPaymentInformationListBuilder({Key? key}) : super(key: key);

   final paymentController = Get.find<UserPaymentInformationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> ListView.builder(
        itemCount: paymentController.userCards.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // child: Row(
            //   children: [
            //     Text(
            //       '${index+1}.',
            //       style: const TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     const SizedBox(width: 15),
            //     Expanded(
            //       child: Text(
            //         paymentController.userCards[index.toString()]['Card Title'],
            //         style: const TextStyle(fontSize: 20),
            //       ),
            //     ),
            //     const SizedBox(width: 15),
            //     (paymentController.userCards[index.toString()]['Default Card'])? const Text('Default', style: TextStyle(color: Colors.greenAccent),):  GestureDetector(
            //       onTap: (){
            //         setCardAsDefault(index);
            //       },
            //       child: const Text('Set Default', style: TextStyle(color: Colors.grey),),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         editUserPaymentCard(index: index, context: context);
            //       },
            //       icon: const Icon(FontAwesomeIcons.pen, color: Colors.blueGrey,),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         deleteUserPaymentCard(index);
            //       },
            //       icon: const Icon(FontAwesomeIcons.trash, color: Colors.amber,),
            //     ),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
