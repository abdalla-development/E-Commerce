import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Shipping/add_shipping_address.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/user_account_screen_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Controllers/user_shipping_addresses_controller.dart';
import '../Models/Shipping Information/user_shipping_information_list_builder.dart';

class ShippingAddressesScreen extends StatelessWidget {
  ShippingAddressesScreen({Key? key}) : super(key: key);

  final userAccountController = Get.find<UserAccountController>();
  final shippingAddresses = Get.find<UserShippingAddressesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'Shipping Address'),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 25),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 550,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 20),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueGrey, width: 2),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: (shippingAddresses.addresses.isEmpty)
                              ? const Center(
                                  child: Text(
                                  'There Are No Saved Addresses Yet',
                                  style:
                                      TextStyle(fontSize: 18, color: Colors.grey),
                                ))
                              : UserShippingInformationListBuilder(),
                        ),
                        Align(
                          alignment: const FractionalOffset(0.98, 0.6),
                          child: IconButton(
                            onPressed: () {
                              shippingAddresses.clearFieldsForEdit();
                              addShippingAddress(context);
                            },
                            icon: const Icon(FontAwesomeIcons.circlePlus),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (userAccountController.showSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
