import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Models/specific_girls_select_category.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import 'package:get/get.dart';
import '../Controllers/store_girls_data_controller.dart';
import '../Controllers/store_screen_controller.dart';

class SpecificGirlsScreenData extends StatelessWidget {
  SpecificGirlsScreenData({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();
  final storeGirlsController = Get.find<StoreGirlsDataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Column(
        children: [
          SelectDeliveryLocation(),
          const SizedBox(height: 20),
          SpecificGirlsSelectCategory(),
          SizedBox(
            height: 570,
            child: SingleChildScrollView(
              child: Column(
                children: (storeController.dataToShowGirls.value == 'Clothes')
                    ? storeGirlsController.girlsClothesWidget
                    : storeGirlsController.girlsAccessoriesWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
