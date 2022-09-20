import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';

final homeController = Get.find<HomeController>();

class ScrollableRowItem extends StatelessWidget {
   ScrollableRowItem({Key? key, required this.itemImageURl, required this.itemCategory, required this.personType}) : super(key: key);

   String itemImageURl;
   String itemCategory;
   String personType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        homeController.homeScreenGoToNext(personCategory: itemCategory, personType: personType);
      },
      child: Column(
        children: [
          ClipOval(
            child: CircleAvatar(
              radius: 50,
              child: Image.asset(
                itemImageURl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 8,),
          Text(itemCategory),
        ],
      ),
    );
  }
}
