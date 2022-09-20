import 'dart:convert';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';

final storeController = Get.find<StoreScreenController>();

class HomeController extends GetxController{

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   uploadStoreData();
  // }

  final CircularBottomNavigationController navigationController = CircularBottomNavigationController(0);

  final cartItems = 0.obs;
  final showSpinner = false.obs;
  final showSortMenu = false.obs;
  final hasBackIcon = false.obs;
  final storeData = {}.obs;
  final userLanguage = 'English'.obs;
  final userFavoritesListCreated = false.obs;
  final userCartListCreated = false.obs;
  final userOrdersListCreated = false.obs;

  void toggleSpinner(){
    showSpinner.value = !showSpinner.value;
  }

  void updateBottomNavBarIndex(int index){
    navigationController.value = index;
  }

  void updateScreenHasLeadingIcon(bool value){
    hasBackIcon.value = value;
  }

  void homeScreenGoToNext({required String personType, required String personCategory}){
    storeController.showSpecificFor(personType: personType, personCategory: personCategory);
    navigationController.value = 1;
    Get.toNamed('/StoreScreen');
  }

  void uploadStoreData() async{
    final snapShot = await FirebaseFirestore.instance.collection('Store').doc('zxQOXP2hU42AwucIfvAh').get();
    storeData.value = jsonDecode(jsonEncode(snapShot));
  }

  void updateUserLanguage(String value){
    userLanguage.value = value;
  }

  void toggleUserFavoritesCreated(bool value){
    userFavoritesListCreated.value = value;
  }

  void toggleUserCartCreated(bool value){
    userCartListCreated.value = value;
  }

  void toggleUserOrdersCreated(bool value){
    userOrdersListCreated.value = value;
  }
}