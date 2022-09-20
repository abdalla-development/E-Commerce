import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/Payement/add_payment_information.dart';
import '../../../User Profile Screen/Controllers/user_payment_information_controller.dart';


class ConfirmOrderPaymentInformation extends StatelessWidget {
   ConfirmOrderPaymentInformation({Key? key}) : super(key: key);

   final paymentController = Get.find<UserPaymentInformationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(
            horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            (paymentController.userDefaultPaymentCard.isEmpty)?const Text('No Default Payment Card', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),) : Text('- ${paymentController.userDefaultPaymentCard['Card Title']}'),
            (paymentController.userCards.length>1)? Row(
              children: [
                GestureDetector(
                    onTap: (){
                      addPaymentInformation(context);
                    },
                    child: const Text('add', style: TextStyle(color: Colors.blueAccent, fontSize: 16, decoration: TextDecoration.underline,),)
                ),
                const SizedBox(width: 8),
                FocusedMenuHolder(
                  blurBackgroundColor: Colors.blueGrey[900],
                  openWithTap: true,
                  menuOffset: -180,
                  menuItems: paymentController.cardSelection,
                  onPressed: (){},
                  child: const Text('Change', style: TextStyle(color: Colors.blueAccent, fontSize: 16, decoration: TextDecoration.underline,),),
                ),
              ],
            ): GestureDetector(
              onTap: (){
                addPaymentInformation(context);
              },
              child: const Text('Add', style: TextStyle(color: Colors.blueAccent, fontSize: 16, decoration: TextDecoration.underline,),),
            ),
          ],
        ),
      ),
    );
  }
}
