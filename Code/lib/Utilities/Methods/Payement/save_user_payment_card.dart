import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_payment_information_controller.dart';
import '../Alert/error_snackBar_message.dart';
import 'package:cryptography/cryptography.dart';

final userInfoController = Get.find<UserInformationScreenController>();
final login = Get.find<LoginController>();
final paymentController = Get.find<UserPaymentInformationController>();
final CollectionReference users =
FirebaseFirestore.instance.collection('UsersPaymentInformation');

void saveUserPaymentCard() async{
  // final algorithm = AesGcm.with256bits();
  //
  // // Generate a random 256-bit secret key
  // final secretKey = await algorithm.newSecretKey();
  //
  // // Generate a random 96-bit nonce.
  // final nonce = algorithm.newNonce();
  //
  // final clearText = paymentController.cardNumber.value;
  // final secretBox = await algorithm.encrypt(
  //   clearText,
  //   secretKey: secretKey,
  //   nonce: nonce,
  // );

  // print('Ciphertext: ${secretBox.cipherText}');
  // print('MAC: ${secretBox.mac}');

  // try{
  //   final snapShot = await FirebaseFirestore.instance
  //       .collection('UsersPaymentInformation')
  //       .doc(login.currentLoggedInUser.value)
  //       .get();
  //   if (snapShot.exists){
  //     final userPaymentInfo = <String, dynamic>{
  //       'Card Title': paymentController.cardTitle.value,
  //       'Card Holder Name': paymentController.cardHolderName.value,
  //       'Card Number': paymentController.cardNumber.value,
  //       'Card Month Expiration': paymentController.cardMonthExpiration.value,
  //       'Card Year Expiration': paymentController.cardYearExpiration.value,
  //       'Default Card': false,
  //     };
  //     int docIndex = 0;
  //     final userPaymentCards = <String, dynamic>{};
  //     for(var obj in snapShot.data()!.keys){
  //       userPaymentCards[obj] = snapShot.data()![obj];
  //       docIndex++;
  //     }
  //     userPaymentCards[docIndex.toString()] = userPaymentInfo;
  //     await users.doc(userInfoController.currentLoggedInUser.value)
  //         .set(userPaymentCards).onError((e, _) => showErrorSnackBarMessage(
  //         message: 'Sorry! Something Went Wrong',
  //         title: 'Saving Unsuccessful'))
  //         .then((value) => showSuccessSnackBarMessage(
  //         title: 'Saving Successfully',
  //         message: 'Your Information Has Being Added'));
  //   }else {
  //     final userPaymentInfo = <String, dynamic>{
  //       'Card Title': paymentController.cardTitle.value,
  //       'Card Holder Name': paymentController.cardHolderName.value,
  //       'Card Number': paymentController.cardNumber.value,
  //       'Card Month Expiration': paymentController.cardMonthExpiration.value,
  //       'Card Year Expiration': paymentController.cardYearExpiration.value,
  //       'Default Card': false,
  //     };
  //
  //     final userPaymentCards = <String, dynamic>{
  //       '0': userPaymentInfo,
  //     };
  //     await users.doc(userInfoController.currentLoggedInUser.value)
  //         .set(userPaymentCards)
  //         .then((value) => showSuccessSnackBarMessage(
  //         title: 'Saving Successfully',
  //         message: 'Your Information Has Being Added'));
  //   }
  // }catch (e){
  //   showErrorSnackBarMessage(
  //       message: e.toString(), title: 'Saving Unsuccessful');
  // }
  // paymentController.loadUserPaymentInformation();
}