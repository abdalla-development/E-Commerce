import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_shipping_addresses_controller.dart';
import '../Alert/error_snackBar_message.dart';

final shippingController = Get.find<UserShippingAddressesController>();
final userInfoController = Get.find<UserInformationScreenController>();
final login = Get.find<LoginController>();
final CollectionReference users =
    FirebaseFirestore.instance.collection('UsersShippingAddresses');

void saveUserShippingAddress() async {
  try {
    final snapShot = await FirebaseFirestore.instance
        .collection('UsersShippingAddresses')
        .doc(login.currentLoggedInUser.value)
        .get();
    if (snapShot.exists){
      final userShippingInfo = <String, dynamic>{
        'Title': shippingController.addressTitle.value,
        'Country': shippingController.addressCountry.value,
        'City': shippingController.addressCity.value,
        'Full Name': shippingController.addressFullName.value,
        'Contact Number': shippingController.addressContactNumber.value,
        'Secondary Contact Number':
        shippingController.addressSecondaryContactNumber.value,
        'Street': shippingController.addressStreet.value,
        'Address Line 1': shippingController.addressLine1.value,
        'Address Line 2': shippingController.addressLine2.value,
        'Postal Code': shippingController.addressPostalCode.value,
        'Contact Email': shippingController.addressContactEmail.value,
        'Additional Information':
        shippingController.addressAdditionalInformation.value,
        'Default': false,
      };

      final userShippingAddress = <String, dynamic>{};
      int docIndex = 0;
      for(var obj in snapShot.data()!.keys){
        userShippingAddress[obj] = snapShot.data()![obj];
        docIndex++;
      }
      userShippingAddress[docIndex.toString()] = userShippingInfo;
      await users.doc(userInfoController.currentLoggedInUser.value)
          .set(userShippingAddress).onError((e, _) => showErrorSnackBarMessage(
          message: 'Sorry! Something Went Wrong',
          title: 'Saving Unsuccessful'))
          .then((value) => showSuccessSnackBarMessage(
          title: 'Saving Successfully',
          message: 'Your Information Has Being Added'));
      // shippingController.addShippingAddress(
      //   index: shippingController.userAddresses.length.toString(),
      //   title: shippingController.addressTitle.value,
      //   isDefault: false,
      //   city: shippingController.addressCity.value,
      //   line1: shippingController.addressLine1.value,
      //   street: shippingController.addressStreet.value,
      //   line2: shippingController.addressLine2.value,
      //   country: shippingController.addressCountry.value,
      //   contactEmail: shippingController.addressContactEmail.value,
      //   postalCode: shippingController.addressPostalCode.value,
      //   contactNumber: shippingController.addressContactNumber.value,
      //   fullName: shippingController.addressFullName.value,
      //   additional: shippingController.addressAdditionalInformation.value,
      //   secondaryContactNumber: shippingController.addressSecondaryContactNumber.value,
      // );
      // userInfoController.toggleLoadingSpinner();
    }else{
      final userShippingInfo = <String, dynamic>{
        'Title': shippingController.addressTitle.value,
        'Country': shippingController.addressCountry.value,
        'City': shippingController.addressCity.value,
        'Full Name': shippingController.addressFullName.value,
        'Contact Number': shippingController.addressContactNumber.value,
        'Secondary Contact Number':
        shippingController.addressSecondaryContactNumber.value,
        'Street': shippingController.addressStreet.value,
        'Address Line 1': shippingController.addressLine1.value,
        'Address Line 2': shippingController.addressLine2.value,
        'Postal Code': shippingController.addressPostalCode.value,
        'Contact Email': shippingController.addressContactEmail.value,
        'Additional Information':
        shippingController.addressAdditionalInformation.value,
        'Default': false,
      };

      final userShippingAddress = <String, dynamic>{
        '0': userShippingInfo,
      };
      await users.doc(userInfoController.currentLoggedInUser.value)
          .set(userShippingAddress).onError((e, _) => showErrorSnackBarMessage(
              message: 'Sorry! Something Went Wrong',
              title: 'Saving Unsuccessful'))
          .then((value) => showSuccessSnackBarMessage(
              title: 'Saving Successfully',
              message: 'Your Information Has Being Added'));
    }
    shippingController.loadUserShippingAddresses();
  } catch (e) {
    showErrorSnackBarMessage(
        message: e.toString(), title: 'Saving Unsuccessful');
  }
}
