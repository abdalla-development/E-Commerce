import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../Screens/Authentication Screens/Controllers/user_information_controller.dart';
import '../../../Screens/Cart Screen/Controllers/cart_screen_controller.dart';
import '../../../Screens/Home Screen/Controllers/home_screen_controller.dart';
import '../../../Screens/Home Screen/Controllers/user_orders_controller.dart';
import '../Alert/error_snackBar_message.dart';
import '../Alert/success_snackBar_message.dart';

final CollectionReference users =
FirebaseFirestore.instance.collection('UsersOrders');
final userInfoController = Get.find<UserInformationScreenController>();
final homeController = Get.find<HomeController>();
final orderController = Get.find<UserOrdersController>();
final cart = Get.find<CartController>();

void createUserOrdersList () async{
  Map<String, dynamic> userOrders = {
    'OrderId': orderController.userOrderID.value,
    'OrderItems': orderController.userOrderItems,
    'OrderPaymentStatus': orderController.userOrderPaymentStatus.value,
  };
  try {
    await users
        .doc(userInfoController.currentLoggedInUser.value)
        .set(userOrders)
        .then((value) => showSuccessSnackBarMessage(title: 'Order Created Successfully', message: 'Your Order Had Been Created'));
    // userInfoController.toggleLoadingSpinner();
    cart.clearUserCart();
    Get.toNamed('/CartScreen');
  } catch (e) {
    showErrorSnackBarMessage(title: 'Order Unsuccessful', message: e.toString());
  }
}