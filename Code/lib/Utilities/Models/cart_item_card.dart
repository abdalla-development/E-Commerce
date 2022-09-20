import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Screens/Cart Screen/Controllers/cart_screen_controller.dart';

final cartController = Get.find<CartController>();

class CartItemCard extends StatelessWidget {
  CartItemCard({
    Key? key,
    required this.itemColor,
    required this.itemDescription,
    required this.itemFreeReturn,
    required this.itemImageUrl,
    required this.itemName,
    required this.itemPrice,
    required this.itemSize,
    required this.itemStockStatus,
    required this.itemQuantity,
  }) : super(key: key);

  String itemImageUrl;
  String itemName;
  String itemDescription;
  String itemFreeReturn;
  String itemSize;
  String itemColor;
  String itemStockStatus;
  double itemPrice;
  int itemQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  itemImageUrl,
                  height: 150,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
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
                          if(itemQuantity>1){
                            cartController.updateItemQuantity(operation: 'Subtract', value: 1, itemName: itemName);
                          }
                        },
                        icon: const Icon(FontAwesomeIcons.minus),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(itemQuantity.toString()),
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
                          cartController.updateItemQuantity(operation: 'Add', value: 1, itemName: itemName);
                        },
                        icon: const Icon(FontAwesomeIcons.plus),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {
                  cartController.deleteItemFromCart(itemName: itemName);
                },
                child: const Text('Delete'),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 8),
                Text(
                  itemDescription,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  itemFreeReturn,
                  style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                const SizedBox(height: 8),
                Text(itemSize,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(
                  itemColor,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  itemStockStatus,
                  style: const TextStyle(fontSize: 14, color: Colors.green),
                ),
                const SizedBox(height: 8),
                Text(
                  '${itemPrice.toString()} SAR',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
