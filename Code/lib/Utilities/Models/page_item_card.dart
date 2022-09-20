import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Screens/Home Screen/Controllers/user_favorites_list_controller.dart';
import '../../Screens/Item Details Screen/Controllers/item_details_screen_controller.dart';

final itemController = Get.find<ItemDetailsScreenController>();
final favoritesController = Get.find<UserFavoritesListController>();

class PageItemCard extends StatelessWidget {
  PageItemCard(
      {Key? key,
      required this.itemPrice,
      required this.itemName,
      required this.imageUrl,
      required this.itemColors,
      required this.itemSizes,
      required this.itemStock,
      required this.itemIndex,
      required this.itemCategory,
      required this.itemGender,
      required this.itemDiscount,
      })
      : super(key: key);

  String imageUrl;
  String itemColors;
  String itemSizes;
  double itemPrice;
  int itemStock;
  String itemName;
  int itemIndex;
  String itemGender;
  String itemCategory;
  int itemDiscount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        itemController.showSelectedItem(itemCategory: itemCategory, itemGender: itemGender, itemIndex: itemIndex);
        favoritesController.checkIfItemInFavorites(gender: itemGender, category: itemCategory, index: itemIndex);
        Get.toNamed('/ItemDetailsScreen');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    height: 150,
                    width: 120,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      height: 22.5,
                      width: 22.5,
                      child: const Center(),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      height: 22.5,
                      width: 22.5,
                      child: const Center(),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.brown,
                        shape: BoxShape.circle,
                      ),
                      height: 22.5,
                      width: 22.5,
                      child: const Center(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  itemName,
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                const Text('Sizes', style: TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 10),
                Text(itemSizes, style: const TextStyle(fontSize: 16), overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 10),
                (itemStock>7)? const Text('In Stock', style: TextStyle(fontSize: 16, color: Colors.green), overflow: TextOverflow.ellipsis,): Text('Only $itemStock left', style: const TextStyle(fontSize: 16, color: Colors.redAccent), overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 10),
                (itemDiscount>0)? Row(
                  children: [
                    Text(itemPrice.toString(), style: const TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough,color: Colors.grey), overflow: TextOverflow.ellipsis,),
                    const SizedBox(width: 6),
                    Text('${(itemPrice-(itemPrice*itemDiscount)/100).toStringAsFixed(2)} SAR', style: const TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),
                  ],
                ) : Text('${itemPrice.toString()} SAR', style: const TextStyle(fontSize: 20), overflow: TextOverflow.ellipsis,),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
