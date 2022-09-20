import 'package:get/get.dart';

class NotificationsSettingsController extends GetxController{
  final dealsNotificationsOn = false.obs;
  final newArrival = false.obs;

  void toggleNewDealsNotification(bool value){
    dealsNotificationsOn.value = value;
  }

  void toggleNewArrivalNotification(bool value){
    newArrival.value = value;
  }
}