import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/User Profile Screen/Controllers/user_shipping_addresses_controller.dart';
import '../Alert/error_snackBar_message.dart';
import 'edit_selected_shipping_address.dart';

final login = Get.find<LoginController>();
final userInfoController = Get.find<UserInformationScreenController>();
final shippingController = Get.find<UserShippingAddressesController>();
final CollectionReference users =
    FirebaseFirestore.instance.collection('UsersShippingAddresses');

void editShippingAddress(
    {required int index, required BuildContext context}) async {
  final snapShot = await FirebaseFirestore.instance
      .collection('UsersShippingAddresses')
      .doc(login.currentLoggedInUser.value)
      .get();

  Map<String, dynamic> userShippingInfo = {};
  Map<String, dynamic> userShippingAddress = {};

  shippingController.clearFieldsForEdit();

  for (var obj in snapShot.data()!.keys) {
    if (obj != index.toString()) {
      userShippingInfo = {
        'Title': snapShot.data()![obj]['Title'],
        'Country': snapShot.data()![obj]['Country'],
        'City': snapShot.data()![obj]['City'],
        'Full Name': snapShot.data()![obj]['Full Name'],
        'Contact Number': snapShot.data()![obj]['Contact Number'],
        'Secondary Contact Number': snapShot.data()![obj]
            ['Secondary Contact Number'],
        'Street': snapShot.data()![obj]['Street'],
        'Address Line 1': snapShot.data()![obj]['Address Line 1'],
        'Address Line 2': snapShot.data()![obj]['Address Line 2'],
        'Postal Code': snapShot.data()![obj]['Postal Code'],
        'Contact Email': snapShot.data()![obj]['Contact Email'],
        'Additional Information': snapShot.data()![obj]['Additional Information'],
        'Default': snapShot.data()![obj]['Default'],
      };
      userShippingAddress[obj] = userShippingInfo;
    } else {
      shippingController.loadShippingDataToEdit(
          fullName: snapShot.data()![obj]['Full Name'],
          contactNumber: snapShot.data()![obj]['Contact Number'],
          contactEmail: snapShot.data()![obj]['Contact Email'],
          city: snapShot.data()![obj]['City'],
          line2: snapShot.data()![obj]['Address Line 2'],
          title: snapShot.data()![obj]['Title'],
          postal: snapShot.data()![obj]['Postal Code'],
          line1: snapShot.data()![obj]['Address Line 1'],
          street: snapShot.data()![obj]['Street'],
          additional: snapShot.data()![obj]['Additional Information'],
          secondaryContactNumber: snapShot.data()![obj]['Secondary Contact Number'],
          country: snapShot.data()![obj]['Country']);
      await editSelectedShippingAddress(context: context, index: index);
      userShippingInfo = {
        'Title': shippingController.addressTitle.value,
        'Country': shippingController.addressCountry.value,
        'City': shippingController.addressCity.value,
        'Full Name': shippingController.addressFullName.value,
        'Contact Number': shippingController.addressContactNumber.value,
        'Secondary Contact Number': shippingController.addressSecondaryContactNumber.value,
        'Street': shippingController.addressStreet.value,
        'Address Line 1': shippingController.addressLine1.value,
        'Address Line 2': shippingController.addressLine2.value,
        'Postal Code': shippingController.addressPostalCode.value,
        'Contact Email': shippingController.addressContactEmail.value,
        'Additional Information': shippingController.addressAdditionalInformation.value,
        'Default': snapShot.data()![obj]['Default'],
      };
      userShippingAddress[obj] = userShippingInfo;
    }
  }
  if(shippingController.updateAddress.value){
    try{
      await users.doc(userInfoController.currentLoggedInUser.value)
          .set(userShippingAddress)
          .then((value) => showSuccessSnackBarMessage(
          title: 'Updated Successfully',
          message: 'Address Had Been Updated'));
    }catch (e){
      showErrorSnackBarMessage(
          message: e.toString(),
          title: 'Update Unsuccessful');
    }
  }
  shippingController.loadUserShippingAddresses();
}
