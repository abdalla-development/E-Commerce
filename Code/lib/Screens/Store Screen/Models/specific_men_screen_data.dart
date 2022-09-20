import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Models/specific_men_select_category.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import 'package:get/get.dart';
import '../Controllers/store_men_data_controller.dart';
import '../Controllers/store_screen_controller.dart';

class SpecificMenScreenData extends StatelessWidget {
  SpecificMenScreenData({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();
  final storeMenController = Get.find<StoreMenDataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          SelectDeliveryLocation(),
          const SizedBox(height: 20),
          SpecificMenSelectCategory(),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: SizedBox(
              height: 570,
              child: SingleChildScrollView(
                child: Column(
                  children: (storeController.dataToShowMen.value == 'Clothes')
                      ? storeMenController.menClothesWidget
                      : (storeController.dataToShowMen.value == 'Accessories')
                          ? storeMenController.menAccessoriesWidget
                          : storeMenController.menPerfumesWidget,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ListView.builder(
// itemCount: (storeController.dataToShowMen.value == 'Clothes')
// ? storeController.menClothes.keys.length
//     : (storeController.dataToShowMen.value == 'Accessories')
// ? storeController.menAccessories.keys.length
//     : storeController.menPerfumes.keys.length,
// itemBuilder: (BuildContext context, int index) {
// return PageItemCard(
// imageUrl: (storeController.dataToShowMen.value == 'Clothes')? storeController.menClothes[index.toString()]['ImageUrl'] : (storeController.dataToShowMen.value == 'Accessories')? storeController.menAccessories[index.toString()]['ImageUrl'] : storeController.menPerfumes[index.toString()]['ImageUrl'],
// itemColors: (storeController.dataToShowMen.value == 'Clothes')? storeController.menClothes[index.toString()]['Colors'] : (storeController.dataToShowMen.value == 'Accessories')? storeController.menAccessories[index.toString()]['Colors'] : storeController.menPerfumes[index.toString()]['Colors'],
// itemStock: (storeController.dataToShowMen.value == 'Clothes')? storeController.menClothes[index.toString()]['Quantity'].toString() : (storeController.dataToShowMen.value == 'Accessories')? storeController.menAccessories[index.toString()]['Quantity'].toString() : storeController.menPerfumes[index.toString()]['Quantity'].toString(),
// itemSizes: (storeController.dataToShowMen.value == 'Clothes')? storeController.menClothes[index.toString()]['Sizes'] : (storeController.dataToShowMen.value == 'Accessories')? storeController.menAccessories[index.toString()]['Sizes'] : storeController.menPerfumes[index.toString()]['Sizes'],
// itemIndex: index,
// itemName: (storeController.dataToShowMen.value == 'Clothes')? storeController.menClothes[index.toString()]['Name'] : (storeController.dataToShowMen.value == 'Accessories')? storeController.menAccessories[index.toString()]['Name'] : storeController.menPerfumes[index.toString()]['Name'],
// itemPrice: (storeController.dataToShowMen.value == 'Clothes')? storeController.menClothes[index.toString()]['Price'].toString() : (storeController.dataToShowMen.value == 'Accessories')? storeController.menAccessories[index.toString()]['Price'].toString() : storeController.menPerfumes[index.toString()]['Price'].toString(),
// );
// },
// )
