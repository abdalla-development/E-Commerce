import 'package:flutter/material.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import 'package:get/get.dart';
import '../../Cart Screen/Controllers/cart_screen_controller.dart';
import '../Controllers/item_details_screen_controller.dart';
import '../Models/item_carousel_slider.dart';
import '../Models/item_quantity_selector.dart';
import '../Models/item_select_size.dart';

class ItemDetailsScreen extends StatelessWidget {
   ItemDetailsScreen({Key? key}) : super(key: key);

   final itemController = Get.find<ItemDetailsScreenController>();
   final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(hasBackIcon: true, onPressed: (){Get.back();}, isUserAccountScreen: false, title: ''),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          itemController.itemData['Name'],
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color(0xff2B4865),
                              fontWeight: FontWeight.bold),
                        ),
                        //itemController.itemData['Name']
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          itemController.itemData['Short Description'],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xff7F8487),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ItemCarouselSlider(),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            const Text(
                              'Sizes',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff5F7161)),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              itemController.itemData['Sizes'],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            const Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff5F7161)),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              '${itemController.itemData['Price']} SAR',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      ItemQuantitySelector(),
                      const SizedBox(height: 15),
                      (itemController.itemAvailableSizes.length == 1)
                          ? Center(
                          child: Text(
                            itemController.itemAvailableSizes.first,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                          : ItemSelectSize(),
                      const SizedBox(height: 15),
                      Center(
                        child: ElevatedButton(
                          style: kCheckOutButtonStyle,
                          onPressed: () {
                            cartController.addItemToCart(
                                item: itemController.itemData,
                                category: itemController.category.value,
                                itemQuantity:
                                itemController.itemSelectedQuantity.value,
                                index: itemController.index.value,
                                gender: itemController.gender.value,
                                selectedSize:
                                itemController.itemSelectedSize.value);
                          },
                          child: const Text('Add To Cart'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          'Description',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          itemController.itemData['Description'],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (itemController.showSpinner.value) ? const Spinner() : Container(),
        ],
      ),
    );
  }
}
