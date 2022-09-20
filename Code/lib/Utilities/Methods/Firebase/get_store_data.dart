import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../Screens/Store Screen/Controllers/store_boys_data_controller.dart';
import '../../../Screens/Store Screen/Controllers/store_girls_data_controller.dart';
import '../../../Screens/Store Screen/Controllers/store_men_data_controller.dart';
import '../../../Screens/Store Screen/Controllers/store_screen_controller.dart';
import '../../../Screens/Store Screen/Controllers/store_women_data_controller.dart';

final storeController = Get.find<StoreScreenController>();
final menController = Get.find<StoreMenDataController>();
final womenController = Get.find<StoreWomenDataController>();
final boysController = Get.find<StoreBoysDataController>();
final girlsController = Get.find<StoreGirlsDataController>();
Map storeData = {};

Future<void> getOnlineStoreData() async {

  DocumentReference reference = FirebaseFirestore.instance.collection('Store').doc('zxQOXP2hU42AwucIfvAh');
  reference.snapshots().listen((querySnapshot) {
    storeData = {
      'Men': querySnapshot['Men'],
      'Women': querySnapshot['Women'],
      'Boys': querySnapshot['Boys'],
      'Girls': querySnapshot['Girls'],
    };
    storeController.loadStoreData(storeData);
    // menController.loadStoreOnlineDataMen();
    // womenController.loadStoreOnlineDataWomen();
    // boysController.loadStoreOnlineDataBoys();
    // girlsController.loadStoreOnlineDataGirls();
    // setState(() {
    //   field =querySnapshot.get("field");
    // });
  });

  // CollectionReference reference = FirebaseFirestore.instance.collection('Store');
  // reference.snapshots().listen((querySnapshot) {
  //   for (var change in querySnapshot.docChanges) {
  //     // Do something with change
  //     print(change);
  //   }
  // });

  // await for (var snapShot in FirebaseFirestore.instance
  //     .collection('Store')
  //     .snapshots()) {
  //   for (var userDocument in snapShot.docs) {
  //     if (userDocument.id == 'zxQOXP2hU42AwucIfvAh') {
  //       storeController.loadStoreData(userDocument.data());
  //     }
  //   }
  // }
}