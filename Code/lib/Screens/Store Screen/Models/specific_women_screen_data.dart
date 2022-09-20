import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Models/specific_women_select_category.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import 'package:get/get.dart';
import '../Controllers/store_screen_controller.dart';
import '../Controllers/store_women_data_controller.dart';

class SpecificWomenScreenData extends StatelessWidget {
  SpecificWomenScreenData({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();
  final storeWomenController = Get.find<StoreWomenDataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Column(
        children: [
          SelectDeliveryLocation(),
          const SizedBox(height: 20),
          SpecificWomenSelectCategory(),
          SizedBox(
            height: 570,
            child: SingleChildScrollView(
              child: Column(
                children: (storeController.dataToShowWomen.value == 'Clothes')
                    ? storeWomenController.womenClothesWidget
                    : (storeController.dataToShowWomen.value == 'Accessories')
                    ? storeWomenController.womenAccessoriesWidget
                    : storeWomenController.womenPerfumesWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
