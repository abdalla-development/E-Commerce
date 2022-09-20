import 'package:get/get.dart';

class UsersRatingController extends GetxController{
  final appLikeRate = 1.0.obs;
  final appEasyToUseRate = 1.0.obs;
  final appUserSatisfactionRate = 1.0.obs;

  void updateAppLikeRate(double value){
    appLikeRate.value = value;
  }

  void updateAppEasyToUseRating(double value){
    appEasyToUseRate.value = value;
  }

  void updateAppUserSatisfactionRating(double value){
    appUserSatisfactionRate.value = value;
  }
}