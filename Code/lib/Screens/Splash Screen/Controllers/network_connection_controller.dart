import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../../Utilities/Methods/Alert/error_snackBar_message.dart';

class NetworkConnectionController extends GetxController{
  final deviceIsConnected = false.obs;
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  late ConnectivityResult result;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    try{
      connectivitySubscription =
          connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    }on PlatformException catch (e){
      showErrorSnackBarMessage(title: 'Network Error', message: e.toString());
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    connectivitySubscription.cancel();
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
      connectionStatus = result;
      switch(connectionStatus){
        case ConnectivityResult.mobile:
          deviceIsConnected.value = true;
          update();
          break;
        case ConnectivityResult.wifi:
          deviceIsConnected.value = true;
          update();
          break;
        case ConnectivityResult.none:
          deviceIsConnected.value = false;
          update();
          break;
        default: showErrorSnackBarMessage(title: 'Network Error', message: 'Couldn\'t Check The Network Connection Status');
      }
  }
}