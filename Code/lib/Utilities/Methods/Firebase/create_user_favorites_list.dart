import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/Home Screen/Controllers/home_screen_controller.dart';

final CollectionReference users =
FirebaseFirestore.instance.collection('UsersFavoritesList');

final userInfoController = Get.find<UserInformationScreenController>();
final homeController = Get.find<HomeController>();

void createUserFavoritesList () async{
  Map<String, dynamic> userFavorites = {
    'Specific Men': {
      'Clothes': <int, dynamic>{},
      'Accessories': <int, dynamic>{},
      'Perfumes': <int, dynamic>{},
    },
    'Specific Women': {
      'Clothes': <int, dynamic>{},
      'Accessories': <int, dynamic>{},
      'Perfumes': <int, dynamic>{},
    },
    'Specific Boys': {
      'Clothes': <int, dynamic>{},
      'Accessories': <int, dynamic>{},
    },
    'Specific Girls': {
      'Clothes': <int, dynamic>{},
      'Accessories': <int, dynamic>{},
    },
  };
  try {
    await users
        .doc(userInfoController.currentLoggedInUser.value)
        .set(userFavorites)
        .then((value) => homeController.toggleUserFavoritesCreated(true));
  } catch (e) {
    homeController.toggleUserFavoritesCreated(false);
  }
}