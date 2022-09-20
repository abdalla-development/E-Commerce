import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Models/cart_item_card.dart';
import '../../../Item Details Screen/Controllers/item_details_screen_controller.dart';
import '../../Controllers/cart_screen_controller.dart';


class CartItems extends StatelessWidget {
   CartItems({Key? key}) : super(key: key);

   final cartController = Get.find<CartController>();
   final itemController = Get.find<ItemDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cartController.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                itemController.showSelectedItem(
                    itemIndex: cartController.cartItems[
                    cartController.cartItems.keys
                        .toList()[index]]['itemIndex'],
                    itemCategory: cartController.cartItems[
                    cartController.cartItems.keys
                        .toList()[index]]['itemCategory'],
                    itemGender: cartController
                        .cartItems[cartController.cartItems.keys.toList()[index]]
                    ['itemGender']);

                Get.toNamed('/ItemDetailsScreen');
              },
              child: CartItemCard(
                itemName: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemName'],
                itemSize: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemSize'],
                itemFreeReturn: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemFreeReturn'],
                itemDescription: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]
                ['itemShortDescription'],
                itemColor: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemColor'],
                itemImageUrl: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemImageUrl'],
                itemPrice: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemPrice']
                    .toDouble(),
                itemStockStatus: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemStockStatus'],
                itemQuantity: cartController.cartItems[
                cartController.cartItems.keys
                    .toList()[index]]['itemQuantity'],
              ),
            );
          },
        ),
      ],
    );
  }
}
