import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_screen_controller.dart';
import '../../../Utilities/Models/page_item_card.dart';

final storeController = Get.find<StoreScreenController>();

class StoreMenDataController extends GetxController{

  final menClothes = {}.obs;
  final menPerfumes = {}.obs;
  final menAccessories = {}.obs;
  List<Widget> menClothesWidget = [];
  List<Widget> menPerfumesWidget = [];
  List<Widget> menAccessoriesWidget = [];
  final menDataLoaded = false.obs;

  Future<bool> loadStoreOnlineDataMen() async{
    int index = 0;
    menClothes.clear();
    menPerfumes.clear();
    menAccessories.clear();
    menClothesWidget.clear();
    menPerfumesWidget.clear();
    menAccessoriesWidget.clear();
    // final snapShot = await FirebaseFirestore.instance.collection('Store').doc('zxQOXP2hU42AwucIfvAh').get();

    if(storeController.storeDataSnapshot.isNotEmpty){
      for( var key in storeController.storeDataSnapshot['Men']['Clothes'].keys){
        menClothes[key] = storeController.storeDataSnapshot['Men']['Clothes'][key];
      }

      for( var key in storeController.storeDataSnapshot['Men']['Accessories'].keys){
        menAccessories[key] = storeController.storeDataSnapshot['Men']['Accessories'][key];
      }

      for( var key in storeController.storeDataSnapshot['Men']['Perfumes'].keys){
        menPerfumes[key] = storeController.storeDataSnapshot['Men']['Perfumes'][key];
      }
      for(var key in menClothes.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: menClothes[key]['Quantity'],
          itemColors: menClothes[key]['Colors'],
          itemName: menClothes[key]['Name'],
          itemSizes: menClothes[key]['Sizes'],
          imageUrl: menClothes[key]['ImageUrl'],
          itemPrice: menClothes[key]['Price'].toDouble(),
          itemGender: 'Specific Men',
          itemCategory: 'Clothes',
          itemDiscount: menClothes[key]['Discount'],
        );
        index ++;
        menClothesWidget.add(pageItemCard);
        (menClothes[key]['Discount']>0)? storeController.addDealsData(addTo: 'Men', card: pageItemCard): null;
        (menClothes[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Men', card: pageItemCard): null;
      }

      index=0;
      for(var key in menAccessories.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: menAccessories[key]['Quantity'],
          itemColors: menAccessories[key]['Colors'],
          itemName: menAccessories[key]['Name'],
          itemSizes: menAccessories[key]['Sizes'],
          imageUrl: menAccessories[key]['ImageUrl'],
          itemPrice: menAccessories[key]['Price'].toDouble(),
          itemCategory: 'Accessories',
          itemGender: 'Specific Men',
          itemDiscount: menAccessories[key]['Discount'],
        );
        index ++;
        menAccessoriesWidget.add(pageItemCard);
        (menAccessories[key]['Discount']>0)? storeController.addDealsData(addTo: 'Men', card: pageItemCard): null;
        (menAccessories[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Men', card: pageItemCard): null;
      }

      index=0;
      for(var key in menPerfumes.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: menPerfumes[key]['Quantity'],
          itemColors: menPerfumes[key]['Colors'],
          itemName: menPerfumes[key]['Name'],
          itemSizes: menPerfumes[key]['Sizes'],
          imageUrl: menPerfumes[key]['ImageUrl'],
          itemPrice: menPerfumes[key]['Price'].toDouble(),
          itemCategory: 'Perfumes',
          itemGender: 'Specific Men',
          itemDiscount: menPerfumes[key]['Discount'],
        );
        index ++;
        menPerfumesWidget.add(pageItemCard);
        (menPerfumes[key]['Discount']>0)? storeController.addDealsData(addTo: 'Men', card: pageItemCard): null;
        (menPerfumes[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Men', card: pageItemCard): null;
      }
      menDataLoaded.value = true;
    }else {
      menDataLoaded.value = false;
    }
    return menDataLoaded.value;
  }
}