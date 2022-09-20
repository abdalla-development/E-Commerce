import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../Controllers/home_screen_controller.dart';

class ItemsOnDeal extends StatelessWidget {
   ItemsOnDeal({Key? key}) : super(key: key);

   final storeController = Get.find<StoreScreenController>();
   final homeScreen = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Current Deals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      storeController.showSpecificFor(personCategory: 'Specific Men',
                          personType: 'Deals');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowDeals.value ==
                            'Specific Men')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowDeals.value ==
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
                          personType: 'Deals');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowDeals.value ==
                            'Specific Women')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowDeals.value ==
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
                          personType: 'Deals');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowDeals.value ==
                            'Specific Boys')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowDeals.value ==
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
                          personType: 'Deals');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (storeController.dataToShowDeals.value ==
                            'Specific Girls')
                            ? const Color(0x4D8D8DAA)
                            : const Color(0x4dD0C9C0),
                        border: (storeController.dataToShowDeals.value ==
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
              children: (storeController.dataToShowDeals.value ==
                  'Specific Men')
                  ? (storeController.dealsMen.length < 3)
                  ? storeController.dealsMen
                  : storeController.dealsMen.sublist(0, 2)
                  : (storeController.dataToShowDeals.value ==
                  'Specific Women')
                  ? (storeController.dealsWomen.length < 3)
                  ? storeController.dealsWomen
                  : storeController.dealsWomen.sublist(0, 2)
                  : (storeController.dataToShowDeals.value ==
                  'Specific Boys')
                  ? (storeController.dealsBoys.length < 3)
                  ? storeController.dealsBoys
                  : storeController.dealsBoys.sublist(0, 2)
                  : (storeController.dealsGirls.length < 3)
                  ? storeController.dealsGirls
                  : storeController.dealsGirls.sublist(0, 2),
            ),
            const SizedBox(height: 6),
            (storeController.dataToShowDeals.value == 'Specific Men' &&
                storeController.dealsMen.length > 2)
                ? Center(
                child: ElevatedButton(
                    style: kSeeMoreButtonStyle,
                    onPressed: () {
                      storeController.showSpecificFor(personCategory: 'Specific Men', personType: 'Deals');
                      homeScreen.updateBottomNavBarIndex(1);
                      Get.offNamed('/StoreScreen');
                    },
                    child: const Text('See More Men Deals')))
                : Container(),
            (storeController.dataToShowDeals.value == 'Specific Women' &&
                storeController.dealsWomen.length > 2)
                ? Center(
                child: ElevatedButton(
                    style: kSeeMoreButtonStyle,
                    onPressed: () {
                      storeController.showSpecificFor(personCategory: 'Specific Women', personType: 'Deals');
                      homeScreen.updateBottomNavBarIndex(1);
                      Get.offNamed('/StoreScreen');
                    },
                    child: const Text('See More Women Deals')))
                : Container(),
            (storeController.dataToShowDeals.value == 'Specific Boys' &&
                storeController.dealsBoys.length > 2)
                ? Center(
                child: ElevatedButton(
                    style: kSeeMoreButtonStyle,
                    onPressed: () {
                      storeController.showSpecificFor(personCategory: 'Specific Boys', personType: 'Deals');
                      homeScreen.updateBottomNavBarIndex(1);
                      Get.offNamed('/StoreScreen');
                    },
                    child: const Text('See More Boys Deals')))
                : Container(),
            (storeController.dataToShowDeals.value == 'Specific Girls' &&
                storeController.dealsGirls.length > 2)
                ? Center(
                child: ElevatedButton(
                    style: kSeeMoreButtonStyle,
                    onPressed: () {
                      storeController.showSpecificFor(personCategory: 'Specific Girls', personType: 'Deals');
                      homeScreen.updateBottomNavBarIndex(1);
                      Get.offNamed('/StoreScreen');
                    },
                    child: const Text('See More Girls Deals')))
                : Container(),
          ],
        ),
      ),
    );
  }
}
