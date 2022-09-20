import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Screens/Store%20Screen/Models/specific_limited_stock_select_category.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import '../Controllers/store_screen_controller.dart';

class SpecificLimitedStockData extends StatelessWidget {
  SpecificLimitedStockData({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Column(
        children: [
          SelectDeliveryLocation(),
          const SizedBox(height: 20),
          SpecificLimitedStockSelectCategory(),
          SizedBox(
            height: 570,
            child: SingleChildScrollView(
              child: Column(
                children: (storeController.dataToShowLimitedStock.value ==
                    'Specific Men')
                    ? storeController.limitedStockMen
                    : (storeController.dataToShowLimitedStock.value == 'Specific Women')
                    ? storeController.limitedStockWomen
                    : (storeController.dataToShowLimitedStock.value ==
                    'Specific Boys')
                    ? storeController.limitedStockBoys
                    : storeController.limitedStockGirls,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
