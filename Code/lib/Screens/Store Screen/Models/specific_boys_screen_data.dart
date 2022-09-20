import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Models/specific_boys_select_category.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import 'package:get/get.dart';
import '../Controllers/store_boys_data_controller.dart';
import '../Controllers/store_screen_controller.dart';

class SpecificBoysScreenData extends StatelessWidget {
  SpecificBoysScreenData({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();
  final storeBoysController = Get.find<StoreBoysDataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Column(
        children: [
          SelectDeliveryLocation(),
          const SizedBox(height: 20),
          SpecificBoysSelectCategory(),
          SizedBox(
            height: 570,
            child: SingleChildScrollView(
              child: Column(
                children: (storeController.dataToShowBoys.value == 'Clothes')
                    ? storeBoysController.boysClothesWidget
                    : storeBoysController.boysAccessoriesWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// PageItemCard(
// itemName: 'Name',
// itemStock: 'only 8 left',
// itemColors: '',
// itemPrice: 'Price SAR',
// imageUrl: 'https://ae01.alicdn.com/kf/HTB1FGZzazLuK1Rjy0Fhq6xpdFXab/Top-and-Top-Spring-Autumn-Casual-Kids-Boys-Clothing-Sets-Cotton-Long-Sleeve-Letters-T-shirt.jpg_220x220xz.jpg',
// itemSizes: 'XXL, XL, L, M, S',
// ),
// const SizedBox(height: 50)
