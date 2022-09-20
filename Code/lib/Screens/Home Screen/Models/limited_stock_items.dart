import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../Controllers/home_screen_controller.dart';

class LimitedStockItems extends StatelessWidget {
  LimitedStockItems({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();
  final homeScreen = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Limited Stock',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      storeController.showSpecificFor(
                          personCategory: 'Specific Men',
                          personType: 'Limited Stock');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowLimitedStock.value ==
                                'Specific Men')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowLimitedStock.value ==
                                'Specific Men')
                            ? Border.all(color: const Color(0xff8D8DAA))
                            : null,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        'Men',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      storeController.showSpecificFor(
                          personCategory: 'Specific Women',
                          personType: 'Limited Stock');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowLimitedStock.value ==
                                'Specific Women')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowLimitedStock.value ==
                                'Specific Women')
                            ? Border.all(color: const Color(0xff8D8DAA))
                            : null,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        'Women',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      storeController.showSpecificFor(
                          personCategory: 'Specific Boys',
                          personType: 'Limited Stock');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowLimitedStock.value ==
                                'Specific Boys')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowLimitedStock.value ==
                                'Specific Boys')
                            ? Border.all(color: const Color(0xff8D8DAA))
                            : null,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        'Boys',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      storeController.showSpecificFor(
                          personCategory: 'Specific Girls',
                          personType: 'Limited Stock');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowLimitedStock.value ==
                                'Specific Girls')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowLimitedStock.value ==
                                'Specific Girls')
                            ? Border.all(color: const Color(0xff8D8DAA))
                            : null,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Text(
                        'Girls',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: (storeController.dataToShowLimitedStock.value ==
                      'Specific Men')
                  ? (storeController.limitedStockMen.length < 3)
                      ? storeController.limitedStockMen
                      : storeController.limitedStockMen.sublist(0, 2)
                  : (storeController.dataToShowLimitedStock.value ==
                          'Specific Women')
                      ? (storeController.limitedStockWomen.length < 3)
                          ? storeController.limitedStockWomen
                          : storeController.limitedStockWomen.sublist(0, 2)
                      : (storeController.dataToShowLimitedStock.value ==
                              'Specific Boys')
                          ? (storeController.limitedStockBoys.length < 3)
                              ? storeController.limitedStockBoys
                              : storeController.limitedStockBoys.sublist(0, 2)
                          : (storeController.limitedStockGirls.length < 3)
                              ? storeController.limitedStockGirls
                              : storeController.limitedStockGirls.sublist(0, 2),
            ),
            const SizedBox(height: 6),
            (storeController.dataToShowLimitedStock.value == 'Specific Men' &&
                    storeController.limitedStockMen.length > 2)
                ? Center(
                    child: ElevatedButton(
                        style: kSeeMoreButtonStyle,
                        onPressed: () {
                          storeController.showSpecificFor(personCategory: 'Specific Men', personType: 'Limited Stock');
                          homeScreen.updateBottomNavBarIndex(1);
                          Get.offNamed('/StoreScreen');
                        },
                        child: const Text('See More For Men')))
                : Container(),
            (storeController.dataToShowLimitedStock.value == 'Specific Women' &&
                    storeController.limitedStockWomen.length > 2)
                ? Center(
                    child: ElevatedButton(
                        style: kSeeMoreButtonStyle,
                        onPressed: () {
                          storeController.showSpecificFor(personCategory: 'Specific Women', personType: 'Limited Stock');
                          homeScreen.updateBottomNavBarIndex(1);
                          Get.offNamed('/StoreScreen');
                        },
                        child: const Text('See More For Women')))
                : Container(),
            (storeController.dataToShowLimitedStock.value == 'Specific Boys' &&
                    storeController.limitedStockBoys.length > 2)
                ? Center(
                    child: ElevatedButton(
                      style: kSeeMoreButtonStyle,
                        onPressed: () {
                          storeController.showSpecificFor(personCategory: 'Specific Boys', personType: 'Limited Stock');
                          homeScreen.updateBottomNavBarIndex(1);
                          Get.offNamed('/StoreScreen');
                        },
                        child: const Text('See More For Boys')))
                : Container(),
            (storeController.dataToShowLimitedStock.value == 'Specific Girls' &&
                    storeController.limitedStockGirls.length > 2)
                ? Center(
                    child: ElevatedButton(
                        style: kSeeMoreButtonStyle,
                        onPressed: () {
                          storeController.showSpecificFor(personCategory: 'Specific Girls', personType: 'Limited Stock');
                          homeScreen.updateBottomNavBarIndex(1);
                          Get.offNamed('/StoreScreen');
                        },
                        child: const Text('See More For Girls')))
                : Container(),
          ],
        ),
      ),
    );
  }
}
