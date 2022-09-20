import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/Utilities/Methods/Firebase/login_user.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Home Screen/Controllers/user_orders_controller.dart';
import '../../Item Details Screen/Controllers/item_details_screen_controller.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../../User Profile Screen/Controllers/user_payment_information_controller.dart';
import '../Controllers/cart_screen_controller.dart';
import '../Models/Confirm Order/confirm_order_cart_item_widget.dart';
import '../Models/Confirm Order/confirm_order_payment_information.dart';
import '../Models/Confirm Order/confirm_order_shipping_addresses.dart';

class ConfirmOrderScreen extends StatelessWidget {
   ConfirmOrderScreen({Key? key}) : super(key: key);

   final cartController = Get.find<CartController>();
   final itemController = Get.find<ItemDetailsScreenController>();
   final paymentController = Get.find<UserPaymentInformationController>();
   final network = Get.find<NetworkConnectionController>();
   final orderController = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: false, title: ''),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25),
                      Center(
                        child: Text(
                          'Confirm Order',
                          style: GoogleFonts.lobster(
                            fontSize: 40.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      ConfirmOrderCartItemWidget(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                          child: const Text('Shipping Address', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),),
                      ),
                      ConfirmOrderShippingAddresses(),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: const Text('Payment Card', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,),),
                      ),
                      ConfirmOrderPaymentInformation(),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          style: kCheckOutButtonStyle,
                          onPressed: () {
                            cartController.checkOrderInputValid();
                            if(cartController.orderInputsValid.value && network.deviceIsConnected.value){
                              orderController.createUserOrder(cartController.cartItems);
                            }
                          },
                          child:  Text(
                            'Proceed to Payment (${cartController.cartTotalPrice.value.toString()} SAR)',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100,)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (cartController.showSpinner.value) ? const Spinner() : Container(),
        ],
      ),
    );
  }
}
