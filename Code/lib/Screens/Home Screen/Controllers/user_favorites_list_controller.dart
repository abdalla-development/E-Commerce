import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../Utilities/Methods/Alert/error_snackBar_message.dart';
import '../../../Utilities/Methods/Firebase/create_user_favorites_list.dart';
import '../../../Utilities/Models/page_item_card.dart';
import '../../Authentication Screens/Controllers/authentication_screens_controller.dart';
import '../../Authentication Screens/Controllers/login_controller.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';

final login = Get.find<LoginController>();
final authentication = Get.find<AuthenticationScreensController>();
final network = Get.find<NetworkConnectionController>();

class UserFavoritesListController extends GetxController{

  List<Widget> favorites = [];
  final menFavoritesClothes = {}.obs;
  final menFavoritesPerfumes = {}.obs;
  final menFavoritesAccessories = {}.obs;
  final userFavorites = {
  'Specific Men': {
      'Clothes': {},
      'Accessories': {},
      'Perfumes': {},
    },
    'Specific Women': {
      'Clothes': {},
      'Accessories': {},
      'Perfumes': {},
    },
    'Specific Boys': {
      'Clothes': {},
      'Accessories': {},
    },
    'Specific Girls': {
      'Clothes': {},
      'Accessories': {},
    },
  }.obs;
  final itemIsAddedToFavorites = false.obs;

  void addDeleteItem({required String gender, required String category, required int index, required Map item}){
    Map<String, dynamic> itemData = {
      'itemCategory': category,
      'itemGender': gender,
      'itemPrice': item['Price'],
      'itemImageUrl': item['ImageUrl'],
      'itemShortDescription': item['Short Description'],
      'itemFreeReturn': 'Free Return',
      'itemName': item['Name'],
      'itemSizes': item['Sizes'],
      'itemIndex': index,
      'itemDiscount': item['Discount'],
      'itemColors': item['Colors'],
      'itemQuantity': item['Quantity'],
    };
    if(userFavorites[gender]![category]![index.toString()]==null){
      itemIsAddedToFavorites.value = true;
      userFavorites[gender]![category]![index.toString()] = itemData;
    }else{
      itemIsAddedToFavorites.value = false;
      userFavorites[gender]![category]?.removeWhere((key, value) => key == index.toString());
    }
    createUserFavoritesWidget();
    saveUserFavoritesListToFirebase();
  }

  void checkIfItemAddedToFavorites({required String gender, required String category, required int index}){
    itemIsAddedToFavorites.value = false;
    if(userFavorites[gender]![category]![index]==null){
      itemIsAddedToFavorites.value = false;
    }else{
      itemIsAddedToFavorites.value = true;
    }
    saveUserFavoritesListToFirebase();
  }

  void getOnlineUserFavoritesList() async{
    final snapShot = await FirebaseFirestore.instance.collection('UsersFavoritesList')
        .doc(login.currentLoggedInUser.value).get();

    if (snapShot.exists){
      for(var gender in snapShot.data()!.keys){
        for(var category in snapShot.data()![gender]!.keys){
          for(var key in snapShot.data()![gender][category].keys){
            if(key!=null && userFavorites[gender]![category]![key]==null){
              userFavorites[gender]![category]![key] = snapShot.data()![gender][category][key];
            }
          }
        }
      }
    }else{
      createUserFavoritesList();
    }
    createUserFavoritesWidget();
    if(authentication.userLoggedIn.value && network.deviceIsConnected.value){
      saveUserFavoritesListToFirebase();
    }
  }

  void saveUserFavoritesListToFirebase() async{
    if(authentication.userLoggedIn.value && network.deviceIsConnected.value){
      try {
        await users
            .doc(userInfoController.currentLoggedInUser.value)
            .set(userFavorites);
      } catch (e) {
        showErrorSnackBarMessage(title: 'Error Updating Favorites', message: e.toString());
      }
    }
  }

  void createUserFavoritesWidget(){
    favorites.clear();
    Divider divider = const Divider(
      indent: 20,
      thickness: 2.5,
      color: Colors.blueGrey,
      endIndent: 20,
    );

    favorites.add(divider);

    for(var gender in userFavorites.keys){
      for (var category in userFavorites[gender]!.keys){
        for (var key in userFavorites[gender]![category]!.keys){
          PageItemCard pageItemCard = PageItemCard(
            itemIndex: userFavorites[gender]![category]![key]['itemIndex'],
            itemDiscount: userFavorites[gender]![category]![key]['itemDiscount'],
            itemColors: userFavorites[gender]![category]![key]['itemColors'],
            itemStock: userFavorites[gender]![category]![key]['itemQuantity'],
            itemName: userFavorites[gender]![category]![key]['itemName'],
            itemSizes: userFavorites[gender]![category]![key]['itemSizes'],
            itemGender: gender,
            itemCategory: category,
            imageUrl: userFavorites[gender]![category]![key]['itemImageUrl'],
            itemPrice: userFavorites[gender]![category]![key]['itemPrice'].toDouble(),
          );
          favorites.add(pageItemCard);
          favorites.add(divider);
        }
      }
    }
  }

  void checkIfItemInFavorites({required String gender, required String category, required int index}){
    if(userFavorites[gender]![category]![index.toString()]!=null){
      itemIsAddedToFavorites.value = true;
    }else {
      itemIsAddedToFavorites.value = false;
    }
  }
}