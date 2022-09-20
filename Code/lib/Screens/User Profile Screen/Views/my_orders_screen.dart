import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Methods/Firebase/login_user.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/order_item_card.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Home Screen/Controllers/user_orders_controller.dart';
import '../Controllers/user_account_screen_controller.dart';
import '../Models/My Orders/orders_details_widget.dart';
import '../Models/My Orders/show_delivered_orders.dart';
import '../Models/My Orders/show_processing_orders.dart';
import '../Models/My Orders/show_returns_orders.dart';
import '../Models/My Orders/show_review_orders.dart';
import '../Models/My Orders/show_shipped_orders.dart';
import '../Models/My Orders/show_unpaid_orders.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({Key? key}) : super(key: key);

  final userAccountController = Get.find<UserAccountController>();
  final orderController = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: (orderController.orderScreenToShow.value=='Main')?customAppBar(hasBackIcon: true, onPressed: (){
                      Get.back();
            }, isUserAccountScreen: true, title: orderController.orderScreenTitle.value) : AppBar(
              leading: IconButton(
                onPressed: () {
                  orderController.updateOrderScreenDataToShow(screenToShow: 'Main', screenTitle: 'My Orders');
                },
                icon: const Icon(FontAwesomeIcons.arrowLeft),
              ),
              title: Text(
                orderController.orderScreenTitle.value,
                style: GoogleFonts.lobster(
                  fontSize: 40.0,
                  color: Colors.grey,
                ),
              ),
            ),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: (orderController.orderScreenToShow.value == 'Main')
                    ? Column(
                        children: [
                          const SizedBox(height: 25),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ShowUnpaidOrders(),
                                ShowProcessingOrders(),
                                ShowShippedOrders(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 45),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ShowDeliveredOrders(),
                                ShowReviewOrders(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25),
                          ShowReturnsOrders(),
                        ],
                      )
                    : Column(
                        children: [
                          const SizedBox(height: 25),
                          OrderSDetailsWidget(),
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
