import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_payment_information_controller.dart';
import 'package:flutter/material.dart';
import '../Alert/error_snackBar_message.dart';
import 'edit_selected_payment_card.dart';

final login = Get.find<LoginController>();
final userInfoController = Get.find<UserInformationScreenController>();
final paymentController = Get.find<UserPaymentInformationController>();
final CollectionReference users =
FirebaseFirestore.instance.collection('UsersPaymentInformation');

void editUserPaymentCard({required int index, required BuildContext context}) async{
  // final snapShot = await FirebaseFirestore.instance
  //     .collection('UsersPaymentInformation')
  //     .doc(login.currentLoggedInUser.value)
  //     .get();
  //
  // Map<String, dynamic> userCardInfo = {};
  // Map<String, dynamic> userPaymentCards = {};
  //
  // paymentController.clearPaymentData();
  //
  // for (var obj in snapShot.data()!.keys) {
  //   if (obj != index.toString()) {
  //     userCardInfo = {
  //       'Card Title': snapShot.data()![obj]['Card Title'],
  //       'Card Holder Name': snapShot.data()![obj]['Card Holder Name'],
  //       'Card Number': snapShot.data()![obj]['Card Number'],
  //       'Card Month Expiration': snapShot.data()![obj]['Card Month Expiration'],
  //       'Card Year Expiration': snapShot.data()![obj]['Card Year Expiration'],
  //       'Default Card': snapShot.data()![obj]['Default Card'],
  //     };
  //     userPaymentCards[obj] = userCardInfo;
  //   } else {
  //     paymentController.loadEditCardData(
  //         title: snapShot.data()![obj]['Card Title'],
  //         number: snapShot.data()![obj]['Card Number'],
  //         month: snapShot.data()![obj]['Card Month Expiration'],
  //         holderName: snapShot.data()![obj]['Card Holder Name'],
  //         year: snapShot.data()![obj]['Card Year Expiration'],
  //       isDefault: snapShot.data()![obj]['Default Card'],
  //     );
  //     await editSelectedPaymentCard(context: context, index: index);
  //     userCardInfo = {
  //       'Card Title': paymentController.cardTitle.value,
  //       'Card Holder Name': paymentController.cardHolderName.value,
  //       'Card Number': paymentController.cardNumber.value,
  //       'Card Month Expiration': paymentController.cardMonthExpiration.value,
  //       'Card Year Expiration': paymentController.cardYearExpiration.value,
  //       'Default Card': snapShot.data()![obj]['Default Card'],
  //     };
  //     userPaymentCards[obj] = userCardInfo;
  //   }
  // }
  //
  // if(paymentController.updateCard.value){
  //   try{
  //     await users.doc(userInfoController.currentLoggedInUser.value)
  //         .set(userPaymentCards)
  //         .then((value) => showSuccessSnackBarMessage(
  //         title: 'Updated Successfully',
  //         message: 'Card Had Been Updated'));
  //   }catch (e){
  //     showErrorSnackBarMessage(
  //         message: e.toString(),
  //         title: 'Update Unsuccessful');
  //   }
  // }
  //
  // paymentController.loadUserPaymentInformation();
}