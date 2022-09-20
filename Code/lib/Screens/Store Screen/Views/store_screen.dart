import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../Controllers/store_screen_controller.dart';
import '../Models/main_store_screen_data.dart';
import '../Models/specific_boys_screen_data.dart';
import '../Models/specific_deals_screen_data.dart';
import '../Models/specific_girls_screen_data.dart';
import '../Models/specific_limited_stock_screen_data.dart';
import '../Models/specific_men_screen_data.dart';
import '../Models/specific_women_screen_data.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();
  final networkController = Get.find<NetworkConnectionController>();

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
              child: (networkController.deviceIsConnected.value || storeController.storeDataLoaded.value)? SafeArea(
                child:
                (storeController.dataToShow.value=='Main')?
                MainStoreScreenData() :
                (storeController.dataToShow.value=='Specific Men')?
                SpecificMenScreenData():
                (storeController.dataToShow.value=='Specific Women')?
                SpecificWomenScreenData() :
                (storeController.dataToShow.value=='Specific Boys')?
                SpecificBoysScreenData():
                (storeController.dataToShow.value=='Specific Girls')?
                SpecificGirlsScreenData() :
                (storeController.dataToShow.value=='Deals')?
                SpecificDealsData() : SpecificLimitedStockData(),
              ) : const Center(
                child:  Text('No Internet Connection'),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (storeController.showSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
