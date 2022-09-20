import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Utilities/Models/select_delivery_location.dart';
import 'package:get/get.dart';
import '../Controllers/store_screen_controller.dart';

class MainStoreScreenData extends StatelessWidget {
   MainStoreScreenData({Key? key}) : super(key: key);

   final storeController = Get.find<StoreScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SelectDeliveryLocation(),
          const SizedBox(height: 20),
          FocusedMenuHolder(
            // MEN
            blurBackgroundColor: Colors.blueGrey[900],
            openWithTap: true,
            menuOffset: 20,
            menuWidth: MediaQuery.of(context).size.width,
            menuItemExtent: 50,
            menuItems: [
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Clothes', personType: 'Specific Men');
                },
                title: const Text('Clothes'),
                trailingIcon: const Icon(FontAwesomeIcons.shirt),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Perfumes', personType: 'Specific Men');
                },
                title: const Text('Perfumes'),
                trailingIcon: const Icon(FontAwesomeIcons.bottleDroplet),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Accessories', personType: 'Specific Men');
                },
                title: const Text('Accessories'),
                trailingIcon: const Icon(FontAwesomeIcons.gem),
              ),
            ],
            onPressed: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'Images/Local/for_men.png',
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FocusedMenuHolder(
            // Women
            blurBackgroundColor: Colors.blueGrey[900],
            openWithTap: true,
            menuOffset: 20,
            menuWidth: MediaQuery.of(context).size.width,
            menuItemExtent: 50,
            menuItems: [
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Clothes', personType: 'Specific Women');
                },
                title: const Text('Clothes'),
                trailingIcon: const Icon(FontAwesomeIcons.shirt),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Perfumes', personType: 'Specific Women');
                },
                title: const Text('Perfumes'),
                trailingIcon: const Icon(FontAwesomeIcons.bottleDroplet),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Accessories', personType: 'Specific Women');
                },
                title: const Text('Accessories'),
                trailingIcon: const Icon(FontAwesomeIcons.gem),
              ),
            ],
            onPressed: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'Images/Local/for_women.jpg',
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FocusedMenuHolder(
            // Boys
            blurBackgroundColor: Colors.blueGrey[900],
            openWithTap: true,
            menuOffset: 20,
            menuWidth: MediaQuery.of(context).size.width,
            menuItemExtent: 50,
            menuItems: [
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Clothes', personType: 'Specific Boys');
                },
                title: const Text('Clothes'),
                trailingIcon: const Icon(FontAwesomeIcons.shirt),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Accessories', personType: 'Specific Boys');
                },
                title: const Text('Accessories'),
                trailingIcon: const Icon(FontAwesomeIcons.gem),
              ),
            ],
            onPressed: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'Images/Local/for_boys.png',
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FocusedMenuHolder(
            // Girls
            blurBackgroundColor: Colors.blueGrey[900],
            openWithTap: true,
            menuOffset: 20,
            menuWidth: MediaQuery.of(context).size.width,
            menuItemExtent: 50,
            menuItems: [
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Clothes', personType: 'Specific Girls');
                },
                title: const Text('Clothes'),
                trailingIcon: const Icon(FontAwesomeIcons.shirt),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Accessories', personType: 'Specific Girls');
                },
                title: const Text('Accessories'),
                trailingIcon: const Icon(FontAwesomeIcons.gem),
              ),
            ],
            onPressed: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'Images/Local/for_girls.jpg',
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FocusedMenuHolder(
            // Girls
            blurBackgroundColor: Colors.blueGrey[900],
            openWithTap: true,
            menuOffset: 20,
            menuWidth: MediaQuery.of(context).size.width,
            menuItemExtent: 50,
            menuItems: [
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Men', personType: 'Deals');
                },
                title: const Text('Men Deals'),
                trailingIcon: const Icon(FontAwesomeIcons.dollarSign),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Women', personType: 'Deals');
                },
                title: const Text('Women Deals'),
                trailingIcon: const Icon(FontAwesomeIcons.dollarSign),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Boys', personType: 'Deals');
                },
                title: const Text('Boys Deals'),
                trailingIcon: const Icon(FontAwesomeIcons.dollarSign),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Girls', personType: 'Deals');
                },
                title: const Text('Girls Deals'),
                trailingIcon: const Icon(FontAwesomeIcons.dollarSign),
              ),
            ],
            onPressed: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'Images/Local/daily_deals.jpg',
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          FocusedMenuHolder(
            // Girls
            blurBackgroundColor: Colors.blueGrey[900],
            openWithTap: true,
            menuOffset: 20,
            menuWidth: MediaQuery.of(context).size.width,
            menuItemExtent: 50,
            menuItems: [
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Men', personType: 'Limited Stock');
                },
                title: const Text('Men'),
                trailingIcon: const Icon(FontAwesomeIcons.arrowTrendDown),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Women', personType: 'Limited Stock');
                },
                title: const Text('Women'),
                trailingIcon: const Icon(FontAwesomeIcons.arrowTrendDown),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Boys', personType: 'Limited Stock');
                },
                title: const Text('Boys'),
                trailingIcon: const Icon(FontAwesomeIcons.arrowTrendDown),
              ),
              FocusedMenuItem(
                onPressed: (){
                  storeController.showSpecificFor(personCategory: 'Specific Girls', personType: 'Limited Stock');
                },
                title: const Text('Girls'),
                trailingIcon: const Icon(FontAwesomeIcons.arrowTrendDown),
              ),
            ],
            onPressed: (){},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 130,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'Images/Local/limited_stock.jpg',
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                ),
              ),
            ),
          ),
          const SizedBox(height: 90,)
        ],
      ),
    );
  }
}
