import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../Controllers/cart_screen_controller.dart';
import '../Models/Cart Screen/cart_items.dart';
import '../Models/Cart Screen/cart_total_details.dart';


class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  final networkController = Get.find<NetworkConnectionController>();
  final storeController = Get.find<StoreScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: false, onPressed: (){}, isUserAccountScreen: false, title: ''),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: (networkController.deviceIsConnected.value || storeController.storeDataLoaded.value)?SafeArea(
                child: Column(
                  children: [
                    SelectDeliveryLocation(),
                    CartTotalDetails(),
                    (cartController.cartItems.isNotEmpty)? divider : Container(),
                    (cartController.cartItems.isNotEmpty)?SizedBox(
                      height: 570,
                      child: SingleChildScrollView(
                        physics: const ScrollPhysics(),
                        child: Column(
                          children: [
                            CartItems(),
                            const SizedBox(height: 70),
                          ],
                        ),
                      ),
                    ): Container(),
                  ],
                ),
              ):const Center(
                child:  Text('No Internet Connection'),
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
