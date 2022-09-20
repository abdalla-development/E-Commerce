import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_boys_data_controller.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_girls_data_controller.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_men_data_controller.dart';
import 'package:shopping/Screens/Store%20Screen/Controllers/store_women_data_controller.dart';
import '../../../Utilities/Models/page_item_card.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';

final homeController = Get.find<HomeController>();
final loadMenData = Get.find<StoreMenDataController>();
final loadWomenData = Get.find<StoreWomenDataController>();
final loadBoysData = Get.find<StoreBoysDataController>();
final loadGirlsData = Get.find<StoreGirlsDataController>();

class StoreScreenController extends GetxController{

  // @override
  // void onReady() async{
  //   // TODO: implement onReady
  //   super.onReady();
  //   getStoreDataSnapShot();
  // }

  final storeDataSnapshot = {}.obs;
  final showSpinner = false.obs;
  final hasBackIcon = false.obs;
  final storeDataLoaded = false.obs;
  final boysDataLoaded = false.obs;
  final girlsDataLoaded = false.obs;
  final menDataLoaded = false.obs;
  final womenDataLoaded = false.obs;
  final dataToShow = 'Main'.obs;
  final dataToShowMen = 'Clothes'.obs;
  final dataToShowWomen = 'Clothes'.obs;
  final dataToShowBoys = 'Clothes'.obs;
  final dataToShowGirls = 'Clothes'.obs;
  final dataToShowDeals = 'Specific Men'.obs;
  final dataToShowLimitedStock = 'Specific Men'.obs;
  List<Widget> dealsMen = [];
  List<Widget> dealsWomen = [];
  List<Widget> dealsBoys = [];
  List<Widget> dealsGirls = [];
  List<Widget> limitedStockMen = [];
  List<Widget> limitedStockWomen = [];
  List<Widget> limitedStockBoys = [];
  List<Widget> limitedStockGirls = [];

  void toggleSpinner() {
    showSpinner.value = !showSpinner.value;
  }

  void toggleDataToShow(String value){
    dataToShow.value = value;
    (dataToShow.value=='Main')? hasBackIcon.value=false : hasBackIcon.value=true;
  }


  void showSpecificFor({required String personType, required String personCategory}){
    dataToShow.value = personType;
    if(personType=='Deals'){
      dataToShowDeals.value= personCategory;
      hasBackIcon.value = true;
    }else if(personType=='Limited Stock'){
      dataToShowLimitedStock.value = personCategory;
      hasBackIcon.value = true;
    } else if(personType=='Specific Men'){
      dataToShowMen.value = personCategory;
      hasBackIcon.value = true;
    }else if(personType=='Specific Women'){
      dataToShowWomen.value = personCategory;
      hasBackIcon.value = true;
    }else if(personType=='Specific Boys'){
      dataToShowBoys.value = personCategory;
      hasBackIcon.value = true;
    }else if(personType=='Specific Girls'){
      dataToShowGirls.value = personCategory;
      hasBackIcon.value = true;
    } else{
      dataToShowMen.value = 'Clothes';
      dataToShowWomen.value = 'Clothes';
      dataToShowBoys.value = 'Clothes';
      dataToShowGirls.value = 'Clothes';
      dataToShowDeals.value= 'Specific Men';
      dataToShowLimitedStock.value= 'Specific Men';
    }
  }

  void addDealsData({required String addTo,required PageItemCard card}){
    if(addTo=='Men'){
      dealsMen.add(card);
    }else if(addTo=='Women'){
      dealsWomen.add(card);
    }else if(addTo=='Boys'){
      dealsBoys.add(card);
    }else if(addTo=='Girls'){
      dealsGirls.add(card);
    }
  }

  void addLimitedStockData({required String addTo,required PageItemCard card}){
    if(addTo=='Men'){
      limitedStockMen.add(card);
    }else if(addTo=='Women'){
      limitedStockWomen.add(card);
    }else if(addTo=='Boys'){
      limitedStockBoys.add(card);
    }else if(addTo=='Girls'){
      limitedStockGirls.add(card);
    }
  }

  // Future<void> getStoreDataSnapShot() async {
  //   await for (var snapShot in FirebaseFirestore.instance
  //       .collection('Store')
  //       .snapshots()) {
  //     for (var userDocument in snapShot.docs) {
  //       if (userDocument.id == 'zxQOXP2hU42AwucIfvAh') {
  //         storeDataSnapshot.value = userDocument.data();
  //         loadStoreData();
  //       }
  //     }
  //   }
  // }

  void loadStoreData(Map data) async{
    storeDataSnapshot.value = data;
    womenDataLoaded.value = await loadWomenData.loadStoreOnlineDataWomen();
    girlsDataLoaded.value = await loadGirlsData.loadStoreOnlineDataGirls();
    boysDataLoaded.value = await loadBoysData.loadStoreOnlineDataBoys();
    menDataLoaded.value = await loadMenData.loadStoreOnlineDataMen();
    if(womenDataLoaded.value && girlsDataLoaded.value && boysDataLoaded.value && menDataLoaded.value){
      storeDataLoaded.value = true;
    }else {
      storeDataLoaded.value = false;
    }
  }
}