import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../Utilities/Methods/Alert/error_snackBar_message.dart';
import '../../../Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Utilities/Methods/Firebase/create_user_cart.dart';
import '../../Authentication Screens/Controllers/authentication_screens_controller.dart';
import '../../Authentication Screens/Controllers/login_controller.dart';
import '../../Splash Screen/Controllers/network_connection_controller.dart';
import '../../User Profile Screen/Controllers/user_payment_information_controller.dart';
import '../../User Profile Screen/Controllers/user_shipping_addresses_controller.dart';

final login = Get.find<LoginController>();
final authentication = Get.find<AuthenticationScreensController>();
final network = Get.find<NetworkConnectionController>();
final payment = Get.find<UserPaymentInformationController>();
final shipping = Get.find<UserShippingAddressesController>();

class CartController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cartTotalPrice.value = 0;
  }

  final showSpinner = false.obs;
  final cartItems = <String, dynamic>{}.obs;
  final cartItemsCount = 0.obs;
  final cartTotalPrice = 1.5.obs;
  final orderInputsValid = false.obs;
  final showCartItems = false.obs;

  void toggleSpinner() {
    showSpinner.value = !showSpinner.value;
  }

  void addItemToCart(
      {required String gender,
      required String category,
      required int index,
      required Map item,
      required int itemQuantity,
      required String selectedSize}) {

    if(cartItems[item['Name']]==null){
      cartItems[item['Name']]= {
        'itemCategory': category,
        'itemGender': gender,
        'itemStockStatus': 'In Stock',
        'itemQuantity': itemQuantity,
        'itemPrice': item['Price'],
        'itemColor': item['Colors'],
        'itemImageUrl': item['ImageUrl'],
        'itemShortDescription': item['Short Description'],
        'itemFreeReturn': 'Free Return',
        'itemName': item['Name'],
        'itemSize': selectedSize,
        'itemIndex': index,
        'itemImages': item['Images'],
        'itemDescription': item['Description'],
      };
      showSuccessSnackBarMessage(title: cartItems[item['Name']]['itemName'], message: 'Had Been Added To The Cart');
    }else{
      showSuccessSnackBarMessage(title: cartItems[item['Name']]['itemName'], message: 'Order Quantity Had Been Updated');
      int temp = cartItems[item['Name']]['itemQuantity']+itemQuantity;
      cartItems[item['Name']]['itemQuantity'] = temp;
    }
    //
    (authentication.userLoggedIn.value && authentication.userLoggedIn.value)? saveUserCartToFirebase(): null;
    getCartTotalPrice();
  }

  void updateItemQuantity({required String operation, required int value, required String itemName}) {
    if(operation=='Add'){
      int temp = cartItems[itemName]['itemQuantity']+ value;
      cartItems[itemName]['itemQuantity'] = temp;
    }else{
      int temp = cartItems[itemName]['itemQuantity']- value;
      cartItems[itemName]['itemQuantity'] = temp;
    }
    getCartTotalPrice();
    (authentication.userLoggedIn.value)? saveUserCartToFirebase(): null;
  }

  void deleteItemFromCart({required String itemName}) {
    cartItems.removeWhere((key, value) => key==itemName);
    getCartTotalPrice();
    (authentication.userLoggedIn.value && authentication.userLoggedIn.value)? saveUserCartToFirebase(): null;
  }

  void getCartTotalPrice(){
    double tempTotal = 0;
    int cartTotalItems = 0;
    for(var obj in cartItems.keys){
      tempTotal = tempTotal + (cartItems[obj]['itemPrice'] * cartItems[obj]['itemQuantity']);
      cartTotalItems = cartTotalItems + cartItems[obj]['itemQuantity'] as int;
    }
    String total = tempTotal.toStringAsFixed(2);
    cartTotalPrice.value = double.parse(total);
    cartItemsCount.value = cartTotalItems;
  }

  void getUserOnlineCart() async{
    final snapShot = await FirebaseFirestore.instance.collection('UsersCart')
        .doc(login.currentLoggedInUser.value).get();
    if (snapShot.exists && snapShot.data()!.isNotEmpty){
      for(var obj in snapShot.data()!.keys){
        if(cartItems[obj]==null && snapShot.data()![obj]!=null){
          cartItems[obj] = snapShot.data()![obj];
        }
      }
      getCartTotalPrice();
    }else if(!snapShot.exists){
      createUserCart();
    }
    (authentication.userLoggedIn.value && authentication.userLoggedIn.value)? saveUserCartToFirebase(): null;
  }

  void saveUserCartToFirebase() async{
    try {
      await users
          .doc(userInfoController.currentLoggedInUser.value)
          .set(cartItems);
    } catch (e) {
      showErrorSnackBarMessage(title: 'Error Updating Cart', message: e.toString());
    }
  }

  void checkOrderInputValid(){
    // if(cartItems.isNotEmpty && shipping.userDefaultShippingAddress.isNotEmpty && payment.userDefaultPaymentCard.isNotEmpty){
    if(cartItems.isNotEmpty && shipping.userDefaultShippingAddress.isNotEmpty){
      orderInputsValid.value = true;
    }
  }

  void clearUserCart(){
    cartItems.clear();
    checkIfCartItemsEmpty();
    getCartTotalPrice();    (authentication.userLoggedIn.value && authentication.userLoggedIn.value)? saveUserCartToFirebase(): null;
  }

  bool checkIfCartItemsEmpty(){
    (cartItems.isNotEmpty)? showCartItems.value = true: showCartItems.value = false;
    return showCartItems.value;
  }
}
