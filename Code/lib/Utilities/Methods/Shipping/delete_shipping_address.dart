import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_shipping_addresses_controller.dart';
import '../Alert/error_snackBar_message.dart';

final login = Get.find<LoginController>();
final userInfoController = Get.find<UserInformationScreenController>();
final shippingController = Get.find<UserShippingAddressesController>();
final CollectionReference users =
FirebaseFirestore.instance.collection('UsersShippingAddresses');

void deleteShippingAddress(int index) async{
  final snapShot = await FirebaseFirestore.instance
      .collection('UsersShippingAddresses')
      .doc(login.currentLoggedInUser.value)
      .get();

  Map<String, dynamic> userShippingInfo = {};
  Map<String, dynamic> userShippingAddress = {};
  int docIndex = 0;

  for (var obj in snapShot.data()!.keys) {
    if (obj != index.toString()) {
      userShippingInfo = {
        'Title': snapShot.data()![obj]['Title'],
        'Country': snapShot.data()![obj]['Country'],
        'City': snapShot.data()![obj]['City'],
        'Full Name': snapShot.data()![obj]['Full Name'],
        'Contact Number': snapShot.data()![obj]['Contact Number'],
        'Secondary Contact Number': snapShot.data()![obj]['Secondary Contact Number'],
        'Street': snapShot.data()![obj]['Street'],
        'Address Line 1': snapShot.data()![obj]['Address Line 1'],
        'Address Line 2': snapShot.data()![obj]['Address Line 2'],
        'Postal Code': snapShot.data()![obj]['Postal Code'],
        'Contact Email': snapShot.data()![obj]['Contact Email'],
        'Additional Information': snapShot.data()![obj]['Additional Information'],
        'Default': snapShot.data()![obj]['Default'],
      };
      userShippingAddress[docIndex.toString()] = userShippingInfo;
      docIndex++;
    }
  }
  try{
    await users.doc(userInfoController.currentLoggedInUser.value)
        .set(userShippingAddress)
        .then((value) => showSuccessSnackBarMessage(
        title: 'Deleted Successfully',
        message: 'Address Had Been Deleted'));
  }catch (e){
    showErrorSnackBarMessage(
        message: e.toString(),
        title: 'Delete Unsuccessful');
  }
  shippingController.loadUserShippingAddresses();
}