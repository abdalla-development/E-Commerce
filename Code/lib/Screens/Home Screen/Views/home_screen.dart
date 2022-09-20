import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../Controllers/home_screen_controller.dart';
import '../Models/limited_stock_items.dart';
import '../Models/scrollable_row_items.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import '../Models/items_on_deal.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   final homeController = Get.find<HomeController>();
   final networkController = Get.find<NetworkConnectionController>();
   final storeController = Get.find<StoreScreenController>();

   @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: false, onPressed: (){}, isUserAccountScreen: false, title: ''),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: (networkController.deviceIsConnected.value || storeController.storeDataLoaded.value)?Column(
                  children: [
                    // CustomAppBar(onPressed: (){},),
                    SelectDeliveryLocation(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 200,
                      child: SingleChildScrollView(
                        child: Column(
                          children:  [
                            ScrollableRowItems(),
                            LimitedStockItems(),
                            ItemsOnDeal(),
                            const SizedBox(height: 90,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ):const Center(
                  child:  Text('No Internet Connection'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (homeController.showSpinner.value)? const Spinner() : Container(),
        ],
      ),
    );
  }
}
