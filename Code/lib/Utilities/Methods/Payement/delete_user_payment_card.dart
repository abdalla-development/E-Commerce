import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_payment_information_controller.dart';
import '../Alert/error_snackBar_message.dart';

final login = Get.find<LoginController>();
final userInfoController = Get.find<UserInformationScreenController>();
final paymentController = Get.find<UserPaymentInformationController>();
final CollectionReference users =
FirebaseFirestore.instance.collection('UsersPaymentInformation');

void deleteUserPaymentCard(int index) async{
  // final snapShot = await FirebaseFirestore.instance
  //     .collection('UsersPaymentInformation')
  //     .doc(login.currentLoggedInUser.value)
  //     .get();
  //
  // Map<String, dynamic> userCardInfo = {};
  // Map<String, dynamic> userPaymentCards = {};
  // int docIndex = 0;
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
  //     userPaymentCards[docIndex.toString()] = userCardInfo;
  //     docIndex++;
  //   }
  // }
  // try{
  //   await users.doc(userInfoController.currentLoggedInUser.value)
  //       .set(userPaymentCards)
  //       .then((value) => showSuccessSnackBarMessage(
  //       title: 'Deleted Successfully',
  //       message: 'Card Had Been Deleted'));
  // }catch (e){
  //   showErrorSnackBarMessage(
  //       message: e.toString(),
  //       title: 'Delete Unsuccessful');
  // }
  // paymentController.loadUserPaymentInformation();
}