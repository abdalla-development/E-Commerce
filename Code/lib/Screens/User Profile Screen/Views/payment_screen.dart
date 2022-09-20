import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Payement/add_payment_information.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../Controllers/user_account_screen_controller.dart';
import '../Controllers/user_payment_information_controller.dart';
import '../Models/Payment Information/user_payment_information_list_builder.dart';

class PaymentScreen extends StatelessWidget {
   PaymentScreen({Key? key}) : super(key: key);

   final paymentController = Get.find<UserPaymentInformationController>();
   final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: true, title: 'Payment'),
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
                          child: (paymentController.userCards.isEmpty)
                              ? const Center(
                              child: Text(
                                'There Are No Saved Addresses Yet',
                                style:
                                TextStyle(fontSize: 18, color: Colors.grey),
                              ))
                              : UserPaymentInformationListBuilder(),
                        ),
                        Align(
                            alignment: const FractionalOffset(0.98, 0.6),
                            child: IconButton(
                                onPressed: () {
                                  // paymentController.clearPaymentData();
                                  // addPaymentInformation(context);
                                },
                                icon: const Icon(FontAwesomeIcons.circlePlus))),
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
