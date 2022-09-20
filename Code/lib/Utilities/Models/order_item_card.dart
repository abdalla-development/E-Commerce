import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Utilities/Methods/Firebase/create_user_orders_list.dart';
import 'package:get/get.dart';
import '../../Screens/Home Screen/Controllers/user_orders_controller.dart';

final orderController = Get.find<UserOrdersController>();

class OrderItemCard extends StatelessWidget {
  OrderItemCard({
    Key? key,
    required this.itemColor,
    required this.itemImageUrl,
    required this.itemName,
    required this.itemPrice,
    required this.itemSize,
    required this.itemQuantity,
    required this.itemIndex,
    required this.itemCategory,
    required this.itemGender,
    required this.itemFreeReturn,
    required this.itemOrderID,
  }) : super(key: key);

  String itemImageUrl;
  String itemName;
  String itemSize;
  String itemColor;
  String itemCategory;
  String itemGender;
  String itemFreeReturn;
  String itemOrderID;
  int itemIndex;
  double itemPrice;
  int itemQuantity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        orderController.updateOrderSelectedItem(
            gender: itemGender,
            category: itemCategory,
            index: itemIndex,
            size: itemSize,
            quantity: itemQuantity,
            color: itemColor,
            returnStatus: itemFreeReturn,
            orderID: itemOrderID,
          orderItemName: itemName,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: itemImageUrl,
                errorWidget: (context, url, error) => Image.asset(
                  'Images/Local/place_holder.png',
                ),
                height: 150,
                width: 80,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Name'),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      itemName,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text('Size'),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(itemSize,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      // const SizedBox(width: 4),
                      Column(
                        children: [
                          const Text('Color'),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text(
                              itemColor,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(width: 4),
                      Column(
                        children: [
                          const Text('Quantity'),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              itemQuantity.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Price'),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      '${itemPrice.toString()} SAR',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
