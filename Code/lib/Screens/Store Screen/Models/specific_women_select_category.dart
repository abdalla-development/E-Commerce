import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../Controllers/store_screen_controller.dart';

class SpecificWomenSelectCategory extends StatelessWidget {
  SpecificWomenSelectCategory({Key? key}) : super(key: key);

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
              storeController.showSpecificFor(personType: 'Specific Women', personCategory: 'Clothes');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (storeController.dataToShowWomen.value == 'Clothes')? const Color(0x4D8D8DAA) : const Color(0x4dD0C9C0),
                border: (storeController.dataToShowWomen.value == 'Clothes')? Border.all(color: const Color(0xff8D8DAA)) : null,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text('Clothes', style: TextStyle(fontSize: 20),),
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: (){
              storeController.showSpecificFor(personType: 'Specific Women', personCategory: 'Perfumes');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (storeController.dataToShowWomen.value == 'Perfumes')? const Color(0x4D8D8DAA) : const Color(0x4dD0C9C0),
                border: (storeController.dataToShowWomen.value == 'Perfumes')? Border.all(color: const Color(0xff8D8DAA)) : null,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text('Perfumes', style: TextStyle(fontSize: 20),),
            ),
          ),
          const SizedBox(width: 2),
          GestureDetector(
            onTap: (){
              storeController.showSpecificFor(personType: 'Specific Women', personCategory: 'Accessories');
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: (storeController.dataToShowWomen.value == 'Accessories')? const Color(0x4D8D8DAA) : const Color(0x4dD0C9C0),
                border: (storeController.dataToShowWomen.value == 'Accessories')? Border.all(color: const Color(0xff8D8DAA)) : null,
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Text('Accessories', style: TextStyle(fontSize: 20),),
            ),
          ),
        ],
      ),
    );
  }
}
