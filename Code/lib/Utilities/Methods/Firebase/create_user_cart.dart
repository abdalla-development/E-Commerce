import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/Home Screen/Controllers/home_screen_controller.dart';

final CollectionReference users =
FirebaseFirestore.instance.collection('UsersCart');
final userInfoController = Get.find<UserInformationScreenController>();
final homeController = Get.find<HomeController>();

void createUserCart () async{
  Map<String, dynamic> userCart = {};
  try {
    await users
        .doc(userInfoController.currentLoggedInUser.value)
        .set(userCart)
        .then((value) => homeController.toggleUserCartCreated(true));
    userInfoController.toggleLoadingSpinner();
  } catch (e) {
    homeController.toggleUserCartCreated(false);
  }
}