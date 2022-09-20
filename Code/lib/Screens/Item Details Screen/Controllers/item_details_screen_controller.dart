import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Home Screen/Controllers/user_favorites_list_controller.dart';
import '../../Store Screen/Controllers/store_boys_data_controller.dart';
import '../../Store Screen/Controllers/store_girls_data_controller.dart';
import '../../Store Screen/Controllers/store_men_data_controller.dart';
import '../../Store Screen/Controllers/store_women_data_controller.dart';

final menData = Get.find<StoreMenDataController>();
final womenData = Get.find<StoreWomenDataController>();
final boysData = Get.find<StoreBoysDataController>();
final girlsData = Get.find<StoreGirlsDataController>();
final favorites = Get.find<UserFavoritesListController>();

class ItemDetailsScreenController extends GetxController{
  final showSpinner = false.obs;
  final category = ''.obs;
  final gender = ''.obs;
  final index = 0.obs;
  final itemData = {}.obs;
  final itemSelectedQuantity = 1.obs;
  final itemSelectedSize = 'XXL'.obs;
  final itemAvailableSizes = [].obs;
  List<Widget> itemAvailableSizesWidget = [];
  List<Widget> imageCarouselImages = [];

  void toggleSpinner(){
    showSpinner.value = !showSpinner.value;
  }


  void showSelectedItem({required String itemCategory, required String itemGender, required int itemIndex}){
    gender.value =  itemGender;
    category.value = itemCategory;
    index.value = itemIndex;
    loadItemData();
  }

  void updateItemSelectedSize(String value){
    itemSelectedSize.value = value;
  }

  void updateItemSelectedQuantity(int value){
    itemSelectedQuantity.value =  value;
  }

  void loadItemData(){
    if(gender.value=='Specific Men'){
      (category.value=='Clothes')? itemData.value = menData.menClothes[index.value.toString()] : (category.value=='Accessories')? itemData.value = menData.menAccessories[index.value.toString()]: itemData.value = menData.menPerfumes[index.value.toString()];
    }else if(gender.value=='Specific Women'){
      (category.value=='Clothes')? itemData.value = womenData.womenClothes[index.value.toString()] : (category.value=='Accessories')? itemData.value = womenData.womenAccessories[index.value.toString()]: itemData.value = womenData.womenPerfumes[index.value.toString()];
    }else if(gender.value=='Specific Boys'){
      (category.value=='Clothes')? itemData.value = boysData.boysClothes[index.value.toString()] : itemData.value = boysData.boysAccessories[index.value.toString()];
    }else if(gender.value=='Specific Girls'){
      (category.value=='Clothes')? itemData.value = girlsData.girlsClothes[index.value.toString()] : itemData.value = girlsData.girlsAccessories[index.value.toString()];
    }
    itemAvailableSizes.value = itemData['Sizes'].split(',');
    loadItemAvailableSizes();
    loadCarouselImages();
    favorites.checkIfItemAddedToFavorites(gender: gender.value, category: category.value, index: index.value);
  }

  void loadItemAvailableSizes(){
    itemAvailableSizesWidget.clear();
    itemSelectedSize.value = itemAvailableSizes.first;
    for(var obj in itemAvailableSizes){
      GestureDetector gestureDetector =GestureDetector(
        child:  Text(
          obj,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () {
          updateItemSelectedSize(obj);
        },
      );
      SizedBox sizedBox = const SizedBox(height: 5);
      itemAvailableSizesWidget.add(gestureDetector);
      itemAvailableSizesWidget.add(sizedBox);
    }
  }

  void loadCarouselImages(){
    imageCarouselImages.clear();
    for(var obj in itemData['Images']){
      ClipRRect clipRRect = ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          obj,
          height: 300,
          width: 1500,
          fit: BoxFit.contain,
        ),
      );
      imageCarouselImages.add(clipRRect);
    }
  }

}
