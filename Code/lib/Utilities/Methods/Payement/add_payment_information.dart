import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Payement/save_user_payment_card.dart';
import '../../../Screens/User Profile Screen/Controllers/user_payment_information_controller.dart';
import '../../Configurations/constants.dart';

final paymentController = Get.find<UserPaymentInformationController>();

Future addPaymentInformation(BuildContext context){
  return showDialog(
    context: context,
    builder: (context) => Obx(
        ()=> SizedBox(
        width: MediaQuery.of(context).size.width,
        // child: AlertDialog(
        //   shape: const RoundedRectangleBorder(
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(32.0),
        //     ),
        //   ),
        //   title: const Text('Card Information'),
        //   content: SingleChildScrollView(
        //     child: Column(
        //       children: [
        //         const SizedBox(height: 8),
        //         TextField(
        //           decoration: kTextFieldDecoration.copyWith(
        //             hintText: 'Card Title',
        //             labelText: (paymentController.cardTitleLabel.value!='')? paymentController.cardTitleLabel.value : null,
        //             labelStyle: const TextStyle(color: Colors.red),
        //           ),
        //           onChanged: (value) {
        //             paymentController.updateCardTitle(value);
        //             paymentController.updateCardTitleLabel('');
        //           },
        //         ),
        //         const SizedBox(height: 8),
        //         TextField(
        //           decoration: kTextFieldDecoration.copyWith(
        //             hintText: 'Name On Card',
        //             labelText: (paymentController.cardHolderNameLabel.value!='')? paymentController.cardHolderNameLabel.value : null,
        //             labelStyle: const TextStyle(color: Colors.red),
        //           ),
        //           onChanged: (value) {
        //             paymentController.updateCardHolderName(value);
        //             paymentController.updateCardHolderNameLabel('');
        //           },
        //         ),
        //         const SizedBox(height: 8),
        //         TextField(
        //           keyboardType: TextInputType.number,
        //           decoration: kTextFieldDecoration.copyWith(
        //             hintText: 'Card Number',
        //             labelText: (paymentController.cardNumberLabel.value!='')? paymentController.cardNumberLabel.value : null,
        //             labelStyle: const TextStyle(color: Colors.red),
        //           ),
        //           onChanged: (value) {
        //             paymentController.updateCardNumber(value);
        //             paymentController.updateCardNumberLabel('');
        //           },
        //         ),
        //         const SizedBox(height: 8),
        //         Row(
        //           children: [
        //             Expanded(
        //               flex: 3,
        //               child: SizedBox(
        //                 height: 40,
        //                 child: TextField(
        //                   keyboardType: TextInputType.number,
        //                   textAlign: TextAlign.center,
        //                   onChanged: (value){
        //                     paymentController.updateMonthExpiration(value);
        //                     paymentController.updateMonthExpirationLabel('');
        //                   },
        //                   decoration:  InputDecoration(
        //                     contentPadding: const EdgeInsets.fromLTRB(2,2,2,2),
        //                     hintText: 'MM',
        //                     labelText: (paymentController.cardMonthExpirationLabel.value!='')? paymentController.cardMonthExpirationLabel.value : null,
        //                     labelStyle: const TextStyle(color: Colors.red),
        //                     iconColor: Colors.black,
        //                     border: const OutlineInputBorder(
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(30.0),
        //                       ),
        //                     ),
        //                     enabledBorder: const OutlineInputBorder(
        //                       borderSide:
        //                       BorderSide(color: Colors.black, width: 1.0),
        //                       borderRadius:
        //                       BorderRadius.all(Radius.circular(32.0)),
        //                     ),
        //                     focusedBorder: const OutlineInputBorder(
        //                       borderSide:
        //                       BorderSide(color: Colors.grey, width: 2.0),
        //                       borderRadius:
        //                       BorderRadius.all(Radius.circular(32.0)),
        //                     ),
        //                     focusColor: Colors.grey,
        //                     // prefixIconColor: Colors.orange,
        //                     // prefixStyle: ,
        //                   ),
        //
        //                 ),
        //               ),
        //             ),
        //             const Text('/', style: TextStyle(fontSize: 40),),
        //             Expanded(
        //               flex: 3,
        //               child: SizedBox(
        //                 height: 40,
        //                 child: TextField(
        //                   keyboardType: TextInputType.number,
        //                   textAlign: TextAlign.center,
        //                   onChanged: (value){
        //                     paymentController.updateYearExpiration(value);
        //                     paymentController.updateYearExpirationLabel('');
        //                   },
        //                   decoration:  InputDecoration(
        //                     contentPadding: const EdgeInsets.fromLTRB(2,2,2,2),
        //                     hintText: 'YY',
        //                     labelText: (paymentController.cardYearExpirationLabel.value!='')? paymentController.cardYearExpirationLabel.value : null,
        //                     labelStyle: const TextStyle(color: Colors.red),
        //                     iconColor: Colors.black,
        //                     border: const OutlineInputBorder(
        //                       borderRadius: BorderRadius.all(
        //                         Radius.circular(30.0),
        //                       ),
        //                     ),
        //                     enabledBorder: const OutlineInputBorder(
        //                       borderSide:
        //                       BorderSide(color: Colors.black, width: 1.0),
        //                       borderRadius:
        //                       BorderRadius.all(Radius.circular(32.0)),
        //                     ),
        //                     focusedBorder: const OutlineInputBorder(
        //                       borderSide:
        //                       BorderSide(color: Colors.grey, width: 2.0),
        //                       borderRadius:
        //                       BorderRadius.all(Radius.circular(32.0)),
        //                     ),
        //                     focusColor: Colors.grey,
        //                   ),
        //
        //                 ),
        //               ),),
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        //   actions: [
        //     TextButton(
        //       onPressed: () {
        //         Navigator.pop(context);
        //       },
        //       child: const Text('Cancel'),
        //     ),
        //     TextButton(
        //       onPressed: () {
        //         paymentController.checkInputsValid();
        //         if(paymentController.inputsValid.value){
        //           saveUserPaymentCard();
        //           Navigator.pop(context);
        //         }
        //       },
        //       child: const Text('Save Card'),
        //     ),
        //   ],
        // ),
      ),
    ),
  );
}