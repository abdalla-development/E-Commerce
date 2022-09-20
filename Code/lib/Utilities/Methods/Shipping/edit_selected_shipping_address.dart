import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Screens/User Profile Screen/Controllers/user_shipping_addresses_controller.dart';
import '../../Configurations/constants.dart';

final shippingController = Get.find<UserShippingAddressesController>();

Future editSelectedShippingAddress({required BuildContext context, required int index}) {
  return showDialog(
    context: context,
    builder: (context) => Obx(
          ()=> SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          title: const Text('Shipping Address'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressTitle.value,
                    labelText: (shippingController.addressTitleLabel.value!='')? shippingController.addressTitleLabel.value : null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressTitle(value);
                    shippingController.updateAddressTitleLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressCountry.value,
                    labelText: (shippingController.addressCountryLabel.value!='')?shippingController.addressCountryLabel.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressCountry(value);
                    shippingController.updateAddressCountryLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressCity.value,
                    labelText: (shippingController.addressCityLabel.value!='')?shippingController.addressCityLabel.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressCity(value);
                    shippingController.updateAddressCityLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressFullName.value,
                    labelText: (shippingController.addressFullNameLabel.value!='')?shippingController.addressFullNameLabel.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressFullName(value);
                    shippingController.updateAddressFullNameLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressContactNumber.value,
                    labelText: (shippingController.addressContactNumberLabel.value!='')?shippingController.addressContactNumberLabel.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressContactNumber(value);
                    shippingController.updateAddressContactNumberLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: (shippingController.addressSecondaryContactNumber.value!='')? shippingController.addressSecondaryContactNumber.value : 'Secondary Contact Number',
                    labelText: (shippingController.addressSecondaryContactNumberLabel.value!='')?shippingController.addressSecondaryContactNumberLabel.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressSecondaryContactNumber(value);
                    shippingController.updateAddressSecondaryContactNumberLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressStreet.value,
                    labelText: (shippingController.addressStreetLabel.value!='')?shippingController.addressStreetLabel.value :null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressStreet(value);
                    shippingController.updateAddressStreetLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressLine1.value,
                    labelText: (shippingController.addressLine1Label.value!='')?shippingController.addressLine1Label.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressLine1(value);
                    shippingController.updateAddressLine1Label('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressLine2.value,
                    labelText: (shippingController.addressLine2Label.value!='')?shippingController.addressLine2Label.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressLine2(value);
                    shippingController.updateAddressLine2Label('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: shippingController.addressPostalCode.value,
                    labelText: (shippingController.addressPostalCodeLabel.value!='')?shippingController.addressPostalCodeLabel.value:null,
                    labelStyle: const TextStyle(color: Colors.red),
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressPostalCode(value);
                    shippingController.updateAddressPostalCodeLabel('');
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: (shippingController.addressContactEmail.value!='')? shippingController.addressContactEmail.value : 'Contact Email',
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressContactEmail(value);
                  },
                ),
                const SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: (shippingController.addressAdditionalInformation.value!='')?shippingController.addressAdditionalInformation.value:'Additional Information',
                  ),
                  onChanged: (value) {
                    shippingController.updateAddressAdditionalInformation(value);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                shippingController.checkAddressInputValidation();
                if(shippingController.inputsValid.value){
                  shippingController.updateCurrentAddress();
                  Navigator.pop(context);
                }
              },
              child: const Text('Update Address'),
            ),
          ],
        ),
      ),
    ),
  );
}
