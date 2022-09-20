import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/item_details_screen_controller.dart';

class ItemSelectSize extends StatelessWidget {
   ItemSelectSize({Key? key}) : super(key: key);

   final itemController = Get.find<ItemDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        margin: const EdgeInsets.symmetric(horizontal: 60),
        child: ExpansionTile(
          iconColor: Colors.black,
          title: Center(
            child: Text(
              itemController.itemSelectedSize.value,
              style: const TextStyle(
                // color: kFlyClassColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          children: itemController.itemAvailableSizesWidget,
        ),
      ),
    );
  }
}
