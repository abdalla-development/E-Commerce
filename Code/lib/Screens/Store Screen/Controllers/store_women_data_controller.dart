import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_screen_controller.dart';
import '../../../Utilities/Models/page_item_card.dart';

final storeController = Get.find<StoreScreenController>();

class StoreWomenDataController extends GetxController{

  final womenClothes = {}.obs;
  final womenPerfumes = {}.obs;
  final womenAccessories = {}.obs;
  List<Widget> womenClothesWidget = [];
  List<Widget> womenPerfumesWidget = [];
  List<Widget> womenAccessoriesWidget = [];
  final womenDataLoaded = false.obs;

  Future<bool> loadStoreOnlineDataWomen() async{
    int index = 0;
    womenClothes.clear();
    womenPerfumes.clear();
    womenAccessories.clear();
    womenClothesWidget.clear();
    womenPerfumesWidget.clear();
    womenAccessoriesWidget.clear();
    // final snapShot = await FirebaseFirestore.instance.collection('Store').doc('zxQOXP2hU42AwucIfvAh').get();

    if(storeController.storeDataSnapshot.isNotEmpty){
      for( var key in storeController.storeDataSnapshot['Women']['Clothes'].keys){
        womenClothes[key] = storeController.storeDataSnapshot['Women']['Clothes'][key];
      }

      for( var key in storeController.storeDataSnapshot['Women']['Accessories'].keys){
        womenAccessories[key] = storeController.storeDataSnapshot['Women']['Accessories'][key];
      }

      for( var key in storeController.storeDataSnapshot['Women']['Perfumes'].keys){
        womenPerfumes[key] = storeController.storeDataSnapshot['Women']['Perfumes'][key];
      }
      for(var key in womenClothes.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: womenClothes[key]['Quantity'],
          itemColors: womenClothes[key]['Colors'],
          itemName: womenClothes[key]['Name'],
          itemSizes: womenClothes[key]['Sizes'],
          imageUrl: womenClothes[key]['ImageUrl'],
          itemPrice: womenClothes[key]['Price'].toDouble(),
          itemCategory: 'Clothes',
          itemGender: 'Specific Women',
          itemDiscount: womenClothes[key]['Discount'],
        );
        index ++;
        womenClothesWidget.add(pageItemCard);
        (womenClothes[key]['Discount']>0)? storeController.addDealsData(addTo: 'Women', card: pageItemCard): null;
        (womenClothes[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Women', card: pageItemCard): null;
      }

      index=0;
      for(var key in womenAccessories.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: womenAccessories[key]['Quantity'],
          itemColors: womenAccessories[key]['Colors'],
          itemName: womenAccessories[key]['Name'],
          itemSizes: womenAccessories[key]['Sizes'],
          imageUrl: womenAccessories[key]['ImageUrl'],
          itemPrice: womenAccessories[key]['Price'].toDouble(),
          itemCategory: 'Accessories',
          itemGender: 'Specific Women',
          itemDiscount: womenAccessories[key]['Discount'],
        );
        index ++;
        womenAccessoriesWidget.add(pageItemCard);
        (womenAccessories[key]['Discount']>0)? storeController.addDealsData(addTo: 'Women', card: pageItemCard): null;
        (womenAccessories[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Women', card: pageItemCard): null;
      }

      index=0;
      for(var key in womenPerfumes.keys){
        PageItemCard pageItemCard = PageItemCard(
          itemIndex: index,
          itemStock: womenPerfumes[key]['Quantity'],
          itemColors: womenPerfumes[key]['Colors'],
          itemName: womenPerfumes[key]['Name'],
          itemSizes: womenPerfumes[key]['Sizes'],
          imageUrl: womenPerfumes[key]['ImageUrl'],
          itemPrice: womenPerfumes[key]['Price'].toDouble(),
          itemCategory: 'Perfumes',
          itemGender: 'Specific Women',
          itemDiscount: womenPerfumes[key]['Discount'],
        );
        index ++;
        womenPerfumesWidget.add(pageItemCard);
        (womenPerfumes[key]['Discount']>0)? storeController.addDealsData(addTo: 'Women', card: pageItemCard): null;
        (womenPerfumes[key]['Quantity']<7)? storeController.addLimitedStockData(addTo: 'Women', card: pageItemCard): null;
      }
      womenDataLoaded.value =true;
    }else {
      womenDataLoaded.value =false;
    }
    return womenDataLoaded.value;
  }
}