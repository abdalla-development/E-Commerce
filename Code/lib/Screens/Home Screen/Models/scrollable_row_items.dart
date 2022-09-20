import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utilities/Models/scrollable_row_item.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../Controllers/home_screen_controller.dart';

class ScrollableRowItems extends StatelessWidget {
   ScrollableRowItems({Key? key}) : super(key: key);

   final storeController = Get.find<StoreScreenController>();
   final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ScrollableRowItem(
              itemImageURl: 'Images/Local/men_clothes.jpg',
              itemCategory: 'Clothes',
              personType: 'Specific Men',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/men_accessories.jpg',
              itemCategory: 'Accessories',
              personType: 'Specific Men',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/men_perfumes.jpg',
              itemCategory: 'Perfumes',
              personType: 'Specific Men',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/women_clothes.jpg',
              itemCategory: 'Clothes',
              personType: 'Specific Women',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/women_accessories.jpg',
              itemCategory: 'Accessories',
              personType: 'Specific Women',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/women_perfumes.jpg',
              itemCategory: 'Perfumes',
              personType: 'Specific Women',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/boys_clothes.jpg',
              itemCategory: 'Clothes',
              personType: 'Specific Boys',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/boys_accessories.jpeg',
              itemCategory: 'Accessories',
              personType: 'Specific Boys',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/girls_clothes.jpg',
              itemCategory: 'Clothes',
              personType: 'Specific Girls',
            ),
            const SizedBox(width: 10,),
            ScrollableRowItem(
              itemImageURl: 'Images/Local/girls_accessories.jpg',
              itemCategory: 'Accessories',
              personType: 'Specific Girls',
            ),
            const SizedBox(width: 10,),
            // ScrollableRowItem(
            //   itemImageURl: 'Images/Local/deals.jpg',
            //   itemCategory: 'Deals',
            //   personType: '',
            // ),
          ],
        ),
      ),
    );
  }
}
