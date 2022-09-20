import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_screen_controller.dart';
import '../../../Utilities/Models/page_item_card.dart';

final storeController = Get.find<StoreScreenController>();

class StoreBoysDataController extends GetxController{

  final boysClothes = {}.obs;
  final boysAccessories = {}.obs;
  List<Widget> boysClothesWidget = [];
  List<Widget> boysAccessoriesWidget = [];
  final boysDataLoaded = false.obs;

  Future<bool> loadStoreOnlineDataBoys() async{
    int index = 0;
    boysClothes.clear();
    boysAccessories.clear();
    boysClothesWidget.clear();
    boysAccessoriesWidget.clear();

    // final snapShot = await FirebaseFirestore.instance.collection('Store').doc('zxQOXP2hU42AwucIfvAh').get();

    if (storeController.storeDataSnapshot.isNotEmpty){
      for( var key in storeController.storeDataSnapshot['Boys']['Clothes'].keys){
        boysClothes[key] = storeController.storeDataSnapshot['Boys']['Clothes'][key];
      }

      for( var key in storeController.storeDataSnapshot['Boys']['Accessories'].keys){
        boysAccessories[key] = storeController.storeDataSnapshot['Boys']['Accessories'][key];
      }

      for(var key in boysClothes.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: boysClothes[key]['Quantity'],
          itemColors: boysClothes[key]['Colors'],
          itemName: boysClothes[key]['Name'],
          itemSizes: boysClothes[key]['Sizes'],
          imageUrl: boysClothes[key]['ImageUrl'],
          itemPrice: boysClothes[key]['Price'].toDouble(),
          itemGender: 'Specific Boys',
          itemCategory: 'Clothes',
          itemDiscount: boysClothes[key]['Discount'],
        );
        index ++;
        boysClothesWidget.add(pageItemCard);
        (boysClothes[key]['Discount']>0)? storeController.addDealsData(addTo: 'Boys', card: pageItemCard): null;
        (boysClothes[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Boys', card: pageItemCard): null;
      }

      index=0;
      for(var key in boysAccessories.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: boysAccessories[key]['Quantity'],
          itemColors: boysAccessories[key]['Colors'],
          itemName: boysAccessories[key]['Name'],
          itemSizes: boysAccessories[key]['Sizes'],
          imageUrl: boysAccessories[key]['ImageUrl'],
          itemPrice: boysAccessories[key]['Price'].toDouble(),
          itemCategory: 'Accessories',
          itemGender: 'Specific Boys',
          itemDiscount: boysAccessories[key]['Discount'],
        );
        index ++;
        boysAccessoriesWidget.add(pageItemCard);
        (boysAccessories[key]['Discount']>0)? storeController.addDealsData(addTo: 'Boys', card: pageItemCard): null;
        (boysAccessories[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Boys', card: pageItemCard): null;
      }
      boysDataLoaded.value = true;
    }else{
      boysDataLoaded.value = false;
    }
    return boysDataLoaded.value;
  }
}

//
// await for (var snapShot in FirebaseFirestore.instance
//     .collection('Store')
// .snapshots()) {
// for (var userDocument in snapShot.docs) {
// if (userDocument.id == 'zxQOXP2hU42AwucIfvAh') {
// boysSnapShot.value = userDocument.data();
// }
// }
// }
// //
// // final snapShot = await FirebaseFirestore.instance.collection('Store').doc('zxQOXP2hU42AwucIfvAh').get();
// if (boysSnapShot.isNotEmpty){
// boysClothes.value = boysSnapShot['Boys']['Clothes'];
// boysAccessories.value = boysSnapShot['Boys']['Accessories'];
//
// // for( var key in boysSnapShot['Boys']['Clothes'].keys){
// //   boysClothes[key] = boysSnapShot['Boys']['Clothes'][key];
// // }
// //
// // for( var key in boysSnapShot['Boys']['Accessories'].keys){
// //   boysAccessories[key] = boysSnapShot['Boys']['Accessories'][key];
// // }