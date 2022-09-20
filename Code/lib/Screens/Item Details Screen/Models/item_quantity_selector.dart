import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controllers/item_details_screen_controller.dart';

class ItemQuantitySelector extends StatelessWidget {
   ItemQuantitySelector({Key? key}) : super(key: key);

   final itemController = Get.find<ItemDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  if(itemController.itemSelectedQuantity.value>1){
                    itemController.updateItemSelectedQuantity(itemController.itemSelectedQuantity.value-1);
                  }
                },
                icon: const Icon(FontAwesomeIcons.minus),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(itemController.itemSelectedQuantity.value.toString()),
            const SizedBox(
              width: 15,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: IconButton(
                onPressed: () {
                  itemController.updateItemSelectedQuantity(itemController.itemSelectedQuantity.value+1);
                },
                icon: const Icon(FontAwesomeIcons.plus),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
