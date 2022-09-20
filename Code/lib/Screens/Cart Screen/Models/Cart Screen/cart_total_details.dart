import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Configurations/constants.dart';
import '../../../../Utilities/Methods/Alert/error_snackBar_message.dart';
import '../../../Splash Screen/Controllers/network_connection_controller.dart';
import '../../../User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../Controllers/cart_screen_controller.dart';


class CartTotalDetails extends StatelessWidget {
   CartTotalDetails({Key? key}) : super(key: key);

   final cartController = Get.find<CartController>();
   final userAccountController = Get.find<UserAccountController>();
   final networkController = Get.find<NetworkConnectionController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 40, vertical: 10),
        child: (cartController.cartItems.isNotEmpty)?Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Total ${cartController.cartTotalPrice.value.toString()} SAR',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: kCheckOutButtonStyle,
              onPressed: () {
                if(userAccountController.userLoggedIn.value && cartController.cartItems.isNotEmpty && networkController.deviceIsConnected.value){
                  Get.toNamed('/ConfirmOrderScreen');
                }else if(!networkController.deviceIsConnected.value){
                  showErrorSnackBarMessage(title: 'No Internet Connection', message: 'Please Check Your Internet Connection To Proceed');
                }else if(!cartController.cartItems.isNotEmpty){
                  showErrorSnackBarMessage(title: 'Cart Empty', message: 'You Need To Add Items First');
                }else if(!userAccountController.userLoggedIn.value){
                  showErrorSnackBarMessage(title: 'You Are Not Logged In', message: 'You Need To Login First');
                }
              },
              child:  Text(
                'proceed to check out (${cartController.cartItemsCount.value.toString()} items)',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ) : Container(
            padding: const EdgeInsets.symmetric(vertical: 250),
            child: const Text('No Items Had Been Added To Cart')) ,
      ),
    );
  }
}
