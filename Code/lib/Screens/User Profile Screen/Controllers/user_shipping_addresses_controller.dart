import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Authentication Screens/Controllers/login_controller.dart';

final login = Get.find<LoginController>();

class UserShippingAddressesController extends GetxController {
  final addressTitle = ''.obs;
  final addressTitleLabel = ''.obs;
  final addressCountry = ''.obs;
  final addressCountryLabel = ''.obs;
  final addressCity = ''.obs;
  final addressCityLabel = ''.obs;
  final addressFullName = ''.obs;
  final addressFullNameLabel = ''.obs;
  final addressContactNumber = ''.obs;
  final addressContactNumberLabel = ''.obs;
  final addressSecondaryContactNumber = ''.obs;
  final addressSecondaryContactNumberLabel = ''.obs;
  final addressStreet = ''.obs;
  final addressStreetLabel = ''.obs;
  final addressLine1 = ''.obs;
  final addressLine1Label = ''.obs;
  final addressLine2 = ''.obs;
  final addressLine2Label = ''.obs;
  final addressPostalCode = ''.obs;
  final addressPostalCodeLabel = ''.obs;
  final addressContactEmail = ''.obs;
  final addressAdditionalInformation = ''.obs;
  final inputsValid = false.obs;
  List<Widget> userAddresses = [];
  final addresses = {}.obs;
  List<FocusedMenuItem> addressesSelection = [];
  final mobileNumberValid = false.obs;
  final mobileSecondaryNumberValid = false.obs;
  final postalCodeValid = false.obs;
  final addressesSnapShot = {}.obs;
  final updateAddress = false.obs;
  final userDefaultShippingAddress = {}.obs;

  void updateAddressTitle(String value) {
    addressTitle.value = value;
  }

  void updateAddressTitleLabel(String value) {
    addressTitleLabel.value = value;
  }

  void updateAddressCountry(String value) {
    addressCountry.value = value;
  }

  void updateAddressCountryLabel(String value) {
    addressCountryLabel.value = value;
  }

  void updateAddressCity(String value) {
    addressCity.value = value;
  }

  void updateAddressCityLabel(String value) {
    addressCityLabel.value = value;
  }

  void updateAddressFullName(String value) {
    addressFullName.value = value;
  }

  void updateAddressFullNameLabel(String value) {
    addressFullNameLabel.value = value;
  }

  void updateAddressContactNumber(String value) {
    addressContactNumber.value = value;
  }

  void updateAddressContactNumberLabel(String value) {
    addressContactNumberLabel.value = value;
  }

  void updateAddressSecondaryContactNumber(String value) {
    addressSecondaryContactNumber.value = value;
  }

  void updateAddressSecondaryContactNumberLabel(String value) {
    addressSecondaryContactNumberLabel.value = value;
  }

  void updateAddressStreet(String value) {
    addressStreet.value = value;
  }

  void updateAddressStreetLabel(String value) {
    addressStreetLabel.value = value;
  }

  void updateAddressLine1(String value) {
    addressLine1.value = value;
  }

  void updateAddressLine1Label(String value) {
    addressLine1Label.value = value;
  }

  void updateAddressLine2(String value) {
    addressLine2.value = value;
  }

  void updateAddressLine2Label(String value) {
    addressLine2Label.value = value;
  }

  void updateAddressPostalCode(String value) {
    addressPostalCode.value = value;
  }

  void updateAddressPostalCodeLabel(String value) {
    addressPostalCodeLabel.value = value;
  }

  void updateAddressContactEmail(String value) {
    addressContactEmail.value = value;
  }

  void updateAddressAdditionalInformation(String value) {
    addressAdditionalInformation.value = value;
  }

  void checkAddressInputValidation() {
    checkMobileNumberValid();
    checkSecondaryMobileNumberValid();
    checkPostalCodeValid();
    if (addressTitle.value != '' &&
        addressCountry.value != '' &&
        addressCity.value != '' &&
        addressFullName.value != '' &&
        addressContactNumber.value != '' &&
        addressStreet.value != '' &&
        addressLine1.value != '' &&
        addressLine2.value != '' &&
        addressPostalCode.value != '' &&
        postalCodeValid.value &&
        mobileNumberValid.value &&
        mobileSecondaryNumberValid.value) {
      inputsValid.value = true;
    } else if (addressTitle.value == '') {
      addressTitleLabel.value = 'You Need To Provide The Address Title';
    } else if (addressCountry.value == '') {
      addressCountryLabel.value = 'You Need To Provide The Address Country';
    } else if (addressCity.value == '') {
      addressCityLabel.value = 'You Need To Provide The Address City';
    } else if (addressFullName.value == '') {
      addressFullNameLabel.value =
          'You Need To Provide The Recipient Full Name';
    } else if (addressContactNumber.value == '' || !mobileNumberValid.value) {
      (addressContactNumber.value == '')
          ? addressContactNumberLabel.value =
              'You Need To Provide The Delivery Contact Number'
          : (!mobileNumberValid.value)
              ? addressContactNumberLabel.value =
                  'You Need To Provide A Valid Delivery Contact Number'
              : null;
    } else if (addressStreet.value == '') {
      addressStreetLabel.value = 'You Need To Provide The Address Street Name';
    } else if (addressLine1.value == '') {
      addressLine1Label.value = 'You Need To Provide The Address Line 1';
    } else if (addressLine2.value == '') {
      addressLine2Label.value = 'You Need To Provide The Address Line 2';
    } else if (addressPostalCode.value == '' || !postalCodeValid.value) {
      (addressPostalCode.value == '')
          ? addressPostalCodeLabel.value =
              'You Need To Provide The Address Postal Code'
          : (!postalCodeValid.value)
              ? addressPostalCodeLabel.value =
                  'You Need To Provide A Valid Postal Code'
              : null;
    } else if (!mobileSecondaryNumberValid.value &&
        addressSecondaryContactNumber.value == '') {
      addressSecondaryContactNumberLabel.value =
          'You Need To Provide A Valid Number';
    }
  }

  void addShippingAddress(
      {required String index,
      required String title,
      required bool isDefault,
      required String country,
      required String city,
      required String fullName,
      required String contactNumber,
      required String secondaryContactNumber,
      required String street,
      required String line1,
      required String line2,
      required String postalCode,
      required String additional,
      required String contactEmail}) {
    addresses[index] = {
      'Title': title,
      'Country': country,
      'City': city,
      'Full Name': fullName,
      'Contact Number': contactNumber,
      'Secondary Contact Number': secondaryContactNumber,
      'Street': street,
      'Address Line 1': line1,
      'Address Line 2': line2,
      'Postal Code': postalCode,
      'Contact Email': contactEmail,
      'Additional Information': additional,
      'Default': isDefault,
    };
  }

  void loadShippingAddresses() {
    for (var obj in addressesSnapShot.keys) {
      addresses[obj] = addressesSnapShot[obj];
      if (addressesSnapShot[obj]['Default']) {
        userDefaultShippingAddress.value = addressesSnapShot[obj];
      }
      loadCurrentAddressSelection();
    }
  }

  void checkMobileNumberValid() {
    Pattern pattern = r'^(\+|00)[1-9][0-9 \-\(\)\.]{7,32}$';
    RegExp regex = RegExp(pattern.toString());
    (!regex.hasMatch(addressContactNumber.value))
        ? mobileNumberValid.value = false
        : mobileNumberValid.value = true;
  }

  void checkSecondaryMobileNumberValid() {
    if (addressSecondaryContactNumber.value == '') {
      mobileSecondaryNumberValid.value = true;
    } else {
      Pattern pattern = r'^(\+|00)[1-9][0-9 \-\(\)\.]{7,32}$';
      RegExp regex = RegExp(pattern.toString());
      (!regex.hasMatch(addressSecondaryContactNumber.value))
          ? mobileSecondaryNumberValid.value = false
          : mobileSecondaryNumberValid.value = true;
    }
  }

  void checkPostalCodeValid() {
    Pattern pattern = r'^[a-z0-9][a-z0-9\- ]{0,10}[a-z0-9]$';
    RegExp regex = RegExp(pattern.toString());
    (!regex.hasMatch(addressPostalCode.value))
        ? postalCodeValid.value = false
        : postalCodeValid.value = true;
  }

  void loadUserShippingAddresses() async {
    addresses.clear();
    await for (var snapShot in FirebaseFirestore.instance
        .collection('UsersShippingAddresses')
        .snapshots()) {
      for (var userDocument in snapShot.docs) {
        if (userDocument.id == login.currentLoggedInUser.value) {
          addressesSnapShot.value = userDocument.data();
          loadShippingAddresses();
        }
      }
    }
  }

  void clearFieldsForEdit() {
    updateAddress.value = false;
    addressTitle.value = '';
    addressTitleLabel.value = '';
    addressCountry.value = '';
    addressCountryLabel.value = '';
    addressCity.value = '';
    addressCityLabel.value = '';
    addressFullName.value = '';
    addressFullNameLabel.value = '';
    addressContactNumber.value = '';
    addressContactNumberLabel.value = '';
    addressSecondaryContactNumber.value = '';
    addressSecondaryContactNumberLabel.value = '';
    addressStreet.value = '';
    addressStreetLabel.value = '';
    addressLine1.value = '';
    addressLine1Label.value = '';
    addressLine2.value = '';
    addressLine2Label.value = '';
    addressPostalCode.value = '';
    addressPostalCodeLabel.value = '';
    addressContactEmail.value = '';
    addressAdditionalInformation.value = '';
    inputsValid.value = false;
    mobileNumberValid.value = false;
    mobileSecondaryNumberValid.value = false;
    postalCodeValid.value = false;
  }

  void loadShippingDataToEdit(
      {required String title,
      required String country,
      required String city,
      required String fullName,
      required String contactNumber,
      required String secondaryContactNumber,
      required String street,
      required String line1,
      required String line2,
      required String postal,
      required String contactEmail,
      required String additional}) {
    addressTitle.value = title;
    addressCountry.value = country;
    addressCity.value = city;
    addressFullName.value = fullName;
    addressContactNumber.value = contactNumber;
    addressSecondaryContactNumber.value = secondaryContactNumber;
    addressStreet.value = street;
    addressLine1.value = line1;
    addressLine2.value = line2;
    addressPostalCode.value = postal;
    addressContactEmail.value = contactEmail;
    addressAdditionalInformation.value = additional;
  }

  void updateCurrentAddress() {
    updateAddress.value = true;
  }

  void loadCurrentAddressSelection() {
    addressesSelection.clear();
    FocusedMenuItem focusedMenuItemTitle = FocusedMenuItem(
      onPressed: () {},
      title: const Text('Select Address'),
    );
    addressesSelection.add(focusedMenuItemTitle);

    for (var obj in addresses.keys) {
      FocusedMenuItem focusedMenuItem =FocusedMenuItem(
        onPressed: () async {
          userDefaultShippingAddress.value = addresses[obj];
        },
        title:  Text(addresses[obj]['Title']),
        trailingIcon: const Icon(FontAwesomeIcons.map),
      );
      addressesSelection.add(focusedMenuItem);
    }
  }
}
