import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_screen_controller.dart';
import '../../../Utilities/Models/page_item_card.dart';

final storeController = Get.find<StoreScreenController>();

class StoreGirlsDataController extends GetxController{

  final girlsClothes = {}.obs;
  final girlsAccessories = {}.obs;
  List<Widget> girlsClothesWidget = [];
  List<Widget> girlsAccessoriesWidget = [];
  final girlsDataLoaded = false.obs;

  Future<bool> loadStoreOnlineDataGirls() async{
    int index = 0;
    girlsClothes.clear();
    girlsAccessories.clear();
    girlsClothesWidget.clear();
    girlsAccessoriesWidget.clear();
    // final snapShot = await FirebaseFirestore.instance.collection('Store').doc('zxQOXP2hU42AwucIfvAh').get();

    if (storeController.storeDataSnapshot.isNotEmpty){
      for( var key in storeController.storeDataSnapshot['Girls']['Clothes'].keys){
        girlsClothes[key] = storeController.storeDataSnapshot['Girls']['Clothes'][key];
      }

      for( var key in storeController.storeDataSnapshot['Girls']['Accessories'].keys){
        girlsAccessories[key] = storeController.storeDataSnapshot['Girls']['Accessories'][key];
      }

      for(var key in girlsClothes.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: girlsClothes[key]['Quantity'],
          itemColors: girlsClothes[key]['Colors'],
          itemName: girlsClothes[key]['Name'],
          itemSizes: girlsClothes[key]['Sizes'],
          imageUrl: girlsClothes[key]['ImageUrl'],
          itemPrice: girlsClothes[key]['Price'].toDouble(),
          itemGender: 'Specific Girls',
          itemCategory: 'Clothes',
          itemDiscount: girlsClothes[key]['Discount'],
        );
        index ++;
        girlsClothesWidget.add(pageItemCard);
        (girlsClothes[key]['Discount']>0)? storeController.addDealsData(addTo: 'Girls', card: pageItemCard): null;
        (girlsClothes[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Girls', card: pageItemCard): null;
      }

      index=0;
      for(var key in girlsAccessories.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: girlsAccessories[key]['Quantity'],
          itemColors: girlsAccessories[key]['Colors'],
          itemName: girlsAccessories[key]['Name'],
          itemSizes: girlsAccessories[key]['Sizes'],
          imageUrl: girlsAccessories[key]['ImageUrl'],
          itemPrice: girlsAccessories[key]['Price'].toDouble(),
          itemGender: 'Specific Girls',
          itemCategory: 'Accessories',
          itemDiscount: girlsAccessories[key]['Discount'],
        );
        index ++;
        girlsAccessoriesWidget.add(pageItemCard);
        (girlsAccessories[key]['Discount']>0)? storeController.addDealsData(addTo: 'Girls', card: pageItemCard): null;
        (girlsAccessories[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Girls', card: pageItemCard): null;
        girlsDataLoaded.value = true;
      }
    }else {
      girlsDataLoaded.value = false;
    }
    return girlsDataLoaded.value;
  }
}