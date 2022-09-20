import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controllers/store_screen_controller.dart';

class SpecificLimitedStockSelectCategory extends StatelessWidget {
  SpecificLimitedStockSelectCategory({Key? key}) : super(key: key);

  final storeController = Get.find<StoreScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: (){
              storeController.showSpecificFor(personType: 'Main', personCategory: '');
            },
            icon: const Icon(FontAwesomeIcons.arrowLeft),
          ),
          GestureDetector(
            onTap: (){
              storeController.showSpecificFor(personType: 'Limited Stock', personCategory: 'Specific Men');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (storeController.dataToShowLimitedStock.value == 'Specific Men')? const Color(0x4D8D8DAA) : const Color(0x4dD0C9C0),
                border: (storeController.dataToShowLimitedStock.value == 'Specific Men')? Border.all(color: const Color(0xff8D8DAA)) : null,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text('Men', style: TextStyle(fontSize: 20),),
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: (){
              storeController.showSpecificFor(personType: 'Limited Stock', personCategory: 'Specific Women');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (storeController.dataToShowLimitedStock.value == 'Specific Women')? const Color(0x4D8D8DAA) : const Color(0x4dD0C9C0),
                border: (storeController.dataToShowLimitedStock.value == 'Specific Women')? Border.all(color: const Color(0xff8D8DAA)) : null,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text('Women', style: TextStyle(fontSize: 20),),
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: (){
              storeController.showSpecificFor(personType: 'Limited Stock', personCategory: 'Specific Boys');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (storeController.dataToShowLimitedStock.value == 'Specific Boys')? const Color(0x4D8D8DAA) : const Color(0x4dD0C9C0),
                border: (storeController.dataToShowLimitedStock.value == 'Specific Boys')? Border.all(color: const Color(0xff8D8DAA)) : null,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text('Boys', style: TextStyle(fontSize: 20),),
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: (){
              storeController.showSpecificFor(personType: 'Limited Stock', personCategory: 'Specific Girls');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (storeController.dataToShowLimitedStock.value == 'Specific Girls')? const Color(0x4D8D8DAA) : const Color(0x4dD0C9C0),
                border: (storeController.dataToShowLimitedStock.value == 'Specific Girls')? Border.all(color: const Color(0xff8D8DAA)) : null,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text('Girls', style: TextStyle(fontSize: 20),),
            ),
          ),
        ],
      ),
    );
  }
}
