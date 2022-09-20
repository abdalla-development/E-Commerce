import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shopping/Screens/Store%20Screen/Models/specific_deals_select_category.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import '../Controllers/store_screen_controller.dart';

class SpecificDealsData extends StatelessWidget {
  SpecificDealsData({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Column(
        children: [
          SelectDeliveryLocation(),
          const SizedBox(height: 20),
          SpecificDealsSelectCategory(),
          SizedBox(
            height: 570,
            child: SingleChildScrollView(
              child: Column(
                children: (storeController.dataToShowDeals.value ==
                        'Specific Men')
                    ? storeController.dealsMen
                    : (storeController.dataToShowDeals.value == 'Specific Women')
                        ? storeController.dealsWomen
                        : (storeController.dataToShowDeals.value ==
                                'Specific Boys')
                            ? storeController.dealsBoys
                            : storeController.dealsGirls,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
