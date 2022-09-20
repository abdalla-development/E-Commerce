import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:min_id/min_id.dart';
import '../../../Utilities/Methods/Alert/error_snackBar_message.dart';
import '../../../Utilities/Methods/Alert/success_snackBar_message.dart';
import '../../../Utilities/Methods/Firebase/create_user_orders_list.dart';
import '../../../Utilities/Models/order_item_card.dart';
import '../../Authentication Screens/Controllers/login_controller.dart';
import '../../Cart Screen/Controllers/cart_screen_controller.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../../User Profile Screen/Controllers/user_information_update_controller.dart';
import '../../User Profile Screen/Controllers/user_shipping_addresses_controller.dart';
import 'package:flutter/material.dart';

final userInfoUpdate = Get.find<UserInformationUpdateController>();
final shipping = Get.find<UserShippingAddressesController>();
final cart = Get.find<CartController>();
final login = Get.find<LoginController>();
final store = Get.find<StoreScreenController>();

class UserOrdersController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    orderItemReviewMessage.value = '';
    orderItemReturnReason.value = '';
    orderItemReturnID.value = '';
    orderReturnID.value = '';
    orderItemRating.value = 1.0;
  }

  final orderScreenToShow = 'Main'.obs;
  final orderScreenTitle = 'My Orders'.obs;
  final orderItemReviewMessage = ''.obs;
  final orderItemReturnReason = ''.obs;
  final orderItemReturnID = ''.obs;
  final orderReturnID = ''.obs;
  final userOrderItems = <String, dynamic>{}.obs;
  final userOrderProcessing = <String, dynamic>{}.obs;
  final userOrderUnpaid = <String, dynamic>{}.obs;
  final userOrderShipped = <String, dynamic>{}.obs;
  final userOrderDelivered = <String, dynamic>{}.obs;
  final userOrderReturn = <String, dynamic>{}.obs;
  final userOrderReview = <String, dynamic>{}.obs;
  final userOrderPaymentStatus = ''.obs;
  final userOrderID = ''.obs;
  final orderDataToShow = <String, dynamic>{}.obs;
  final orderItemDetails = <String, dynamic>{}.obs;
  final orderItemRating = 1.0.obs;

  void updateOrderScreenDataToShow({required String screenToShow, required String screenTitle}) async{
    orderScreenToShow.value = screenToShow;
    orderScreenTitle.value = screenTitle;
    orderDataToShow.clear();
    List<Widget> orderItemsList = [];
    if(screenToShow=='Processing'){
      for (var order in userOrderProcessing.keys){
        List<Widget> orderItemsListTemp = [];
        for(var item in userOrderProcessing[order].keys){
          OrderItemCard orderItemCard = OrderItemCard(
            itemColor: 'Black',
            itemImageUrl: userOrderProcessing[order][item]['itemImageUrl'],
            itemName: userOrderProcessing[order][item]['itemName'],
            itemPrice: userOrderProcessing[order][item]['itemPrice'].toDouble(),
            itemSize: userOrderProcessing[order][item]['itemSize'],
            itemQuantity: userOrderProcessing[order][item]['itemQuantity'],
            itemIndex: userOrderProcessing[order][item]['itemIndex'],
            itemCategory: userOrderProcessing[order][item]['itemCategory'],
            itemGender: userOrderProcessing[order][item]['itemGender'],
            itemFreeReturn: userOrderProcessing[order][item]['itemFreeReturn'],
            itemOrderID: order,
          );
          orderItemsListTemp.add(orderItemCard);
        }
        orderItemsList = orderItemsListTemp;
        orderDataToShow[order] = orderItemsList;
      }
    }else if(screenToShow=='Unpaid'){
      orderDataToShow.clear();
      for (var order in userOrderUnpaid.keys){
        List<Widget> orderItemsListTemp = [];
        for(var item in userOrderUnpaid[order].keys){
          OrderItemCard orderItemCard = OrderItemCard(
            itemColor: 'Black',
            itemImageUrl: userOrderUnpaid[order][item]['itemImageUrl'],
            itemName: userOrderUnpaid[order][item]['itemName'],
            itemPrice: userOrderUnpaid[order][item]['itemPrice'].toDouble(),
            itemSize: userOrderUnpaid[order][item]['itemSize'],
            itemQuantity: userOrderUnpaid[order][item]['itemQuantity'],
            itemIndex: userOrderUnpaid[order][item]['itemIndex'],
            itemCategory: userOrderUnpaid[order][item]['itemCategory'],
            itemGender: userOrderUnpaid[order][item]['itemGender'],
            itemFreeReturn: userOrderUnpaid[order][item]['itemFreeReturn'],
            itemOrderID: order,
          );
          orderItemsListTemp.add(orderItemCard);
        }
        orderItemsList = orderItemsListTemp;
        orderDataToShow[order] = orderItemsList;
      }
    }else if(screenToShow=='Shipped'){
      orderDataToShow.clear();
      for (var order in userOrderShipped.keys){
        List<Widget> orderItemsListTemp = [];
        for(var item in userOrderShipped[order].keys){
          OrderItemCard orderItemCard = OrderItemCard(
            itemColor: 'Black',
            itemImageUrl: userOrderShipped[order][item]['itemImageUrl'],
            itemName: userOrderShipped[order][item]['itemName'],
            itemPrice: userOrderShipped[order][item]['itemPrice'].toDouble(),
            itemSize: userOrderShipped[order][item]['itemSize'],
            itemQuantity: userOrderShipped[order][item]['itemQuantity'],
            itemIndex: userOrderShipped[order][item]['itemIndex'],
            itemCategory: userOrderShipped[order][item]['itemCategory'],
            itemGender: userOrderShipped[order][item]['itemGender'],
            itemFreeReturn: userOrderShipped[order][item]['itemFreeReturn'],
            itemOrderID: order,
          );
          orderItemsListTemp.add(orderItemCard);
        }
        orderItemsList = orderItemsListTemp;
        orderDataToShow[order] = orderItemsList;
      }
    }else if(screenToShow=='Delivered'){
      orderDataToShow.clear();
      for (var order in userOrderDelivered.keys){
        List<Widget> orderItemsListTemp = [];
        for(var item in userOrderDelivered[order].keys){
          OrderItemCard orderItemCard = OrderItemCard(
            itemColor: 'Black',
            itemImageUrl: userOrderDelivered[order][item]['itemImageUrl'],
            itemName: userOrderDelivered[order][item]['itemName'],
            itemPrice: userOrderDelivered[order][item]['itemPrice'].toDouble(),
            itemSize: userOrderDelivered[order][item]['itemSize'],
            itemQuantity: userOrderDelivered[order][item]['itemQuantity'],
            itemIndex: userOrderDelivered[order][item]['itemIndex'],
            itemCategory: userOrderDelivered[order][item]['itemCategory'],
            itemGender: userOrderDelivered[order][item]['itemGender'],
            itemFreeReturn: userOrderDelivered[order][item]['itemFreeReturn'],
            itemOrderID: order,
          );
          orderItemsListTemp.add(orderItemCard);
        }
        orderItemsList = orderItemsListTemp;
        orderDataToShow[order] = orderItemsList;
      }
    }else if(screenToShow=='Return'){
      orderDataToShow.clear();
      for (var order in userOrderReturn.keys){
        List<Widget> orderItemsListTemp = [];
        for(var item in userOrderReturn[order].keys){
          OrderItemCard orderItemCard = OrderItemCard(
            itemColor: 'Black',
            itemImageUrl: userOrderReturn[order][item]['itemImageUrl'],
            itemName: userOrderReturn[order][item]['itemName'],
            itemPrice: userOrderReturn[order][item]['itemPrice'].toDouble(),
            itemSize: userOrderReturn[order][item]['itemSize'],
            itemQuantity: userOrderReturn[order][item]['itemQuantity'],
            itemIndex: userOrderReturn[order][item]['itemIndex'],
            itemCategory: userOrderReturn[order][item]['itemCategory'],
            itemGender: userOrderReturn[order][item]['itemGender'],
            itemFreeReturn: userOrderReturn[order][item]['itemFreeReturn'],
            itemOrderID: order,
          );
          orderItemsListTemp.add(orderItemCard);
        }
        orderItemsList = orderItemsListTemp;
        orderDataToShow[order] = orderItemsList;
      }
    }else if(screenToShow=='Review'){
      orderDataToShow.clear();
      for (var order in userOrderReview.keys){
        List<Widget> orderItemsListTemp = [];
        for(var item in userOrderReview[order].keys){
          OrderItemCard orderItemCard = OrderItemCard(
            itemColor: 'Black',
            itemImageUrl: userOrderReview[order][item]['itemImageUrl'],
            itemName: userOrderReview[order][item]['itemName'],
            itemPrice: userOrderReview[order][item]['itemPrice'].toDouble(),
            itemSize: userOrderReview[order][item]['itemSize'],
            itemQuantity: userOrderReview[order][item]['itemQuantity'],
            itemIndex: userOrderReview[order][item]['itemIndex'],
            itemCategory: userOrderReview[order][item]['itemCategory'],
            itemGender: userOrderReview[order][item]['itemGender'],
            itemFreeReturn: userOrderReview[order][item]['itemFreeReturn'],
            itemOrderID: order,
          );
          orderItemsListTemp.add(orderItemCard);
        }
        orderItemsList = orderItemsListTemp;
        orderDataToShow[order] = orderItemsList;
      }
    }
  }

  void generateUserOrderID(){
    final stringId = MinId.getId('{4(ABC)}-9{d}');
    userOrderID.value = '${userInfoUpdate.username.value.toUpperCase()}-${shipping.userDefaultShippingAddress['Title'].toUpperCase()}-$stringId';
  }

  void createUserOrder(Map<String, dynamic> items){
    userOrderItems.value = items;
    generateUserOrderID();
    checkOrderPayment();
    saveOrderToFirebase();
  }

  void saveOrderToFirebase() async{
    final snapShot = await FirebaseFirestore.instance.collection('UsersOrders')
        .doc(login.currentLoggedInUser.value).get();

    Map<String, dynamic> userOrders = {
      userOrderID.value: {
        'OrderItems': userOrderItems,
        'Order Status': userOrderPaymentStatus.value,
      },
    };

    if(snapShot.exists){
      try {
        await users
            .doc(userInfoController.currentLoggedInUser.value)
            .update(userOrders)
            .then((value) => showSuccessSnackBarMessage(title: 'Order Created Successfully', message: 'Your Order Had Been Created'));
        cart.clearUserCart();
        getUserOnlineOrders();
        Get.toNamed('/CartScreen');
      } catch (e) {
        showErrorSnackBarMessage(title: 'Order Unsuccessful', message: e.toString());
      }
    }else {
      createUserOrdersList();
    }
  }

  void checkOrderPayment() async{
    userOrderPaymentStatus.value = 'Delivered';
  }

  void getUserOnlineOrders() async{
    userOrderProcessing.clear();
    userOrderUnpaid.clear();
    userOrderShipped.clear();
    userOrderDelivered.clear();
    userOrderReturn.clear();
    userOrderReview.clear();
    final snapShot = await FirebaseFirestore.instance.collection('UsersOrders')
        .doc(login.currentLoggedInUser.value).get();
    if(snapShot.exists && snapShot.data()!=null){
      for(var order in snapShot.data()!.keys){
        if(snapShot.data()![order]['Order Status']=='Processing'){
          userOrderProcessing[order] = snapShot.data()![order]['OrderItems'];
        }else if(snapShot.data()![order]['Order Status']=='Unpaid'){
          userOrderUnpaid[order] = snapShot.data()![order]['OrderItems'];
        }else if(snapShot.data()![order]['Order Status']=='Shipped'){
          userOrderShipped[order] = snapShot.data()![order]['OrderItems'];
        }else if(snapShot.data()![order]['Order Status']=='Delivered'){
          userOrderDelivered[order] = snapShot.data()![order]['OrderItems'];
        }else if(snapShot.data()![order]['Order Status']=='Return'){
          userOrderReturn[order] = snapShot.data()![order]['OrderItems'];
        }else if(snapShot.data()![order]['Order Status']=='Review'){
          userOrderReview[order] = snapShot.data()![order]['OrderItems'];
        }
      }
    }
    updateOrderScreenDataToShow(screenToShow: orderScreenToShow.value, screenTitle: orderScreenTitle.value);
  }

  void updateOrderStatus({required String orderId, required String orderStatus}) async{
    userOrderItems.clear();
    final snapShot = await FirebaseFirestore.instance.collection('UsersOrders')
        .doc(login.currentLoggedInUser.value).get();
    if(snapShot.exists && snapShot.data()!=null){
      for(var order in snapShot.data()!.keys){
        if(order == orderId){
          userOrderItems[order] = {
            'OrderItems': snapShot.data()![order]['OrderItems'],
            'Order Status': orderStatus,
          };
        }else {
          userOrderItems[order] = {
            'OrderItems': snapShot.data()![order]['OrderItems'],
            'Order Status': snapShot.data()![order]['Order Status'],
          };
        }
      }
      try {
        await users
            .doc(userInfoController.currentLoggedInUser.value)
            .update(userOrderItems)
            .then((value) => showSuccessSnackBarMessage(title: 'Order Created Successfully', message: 'Your Order Had Been Created'));
        cart.clearUserCart();
        Get.toNamed('/CartScreen');
      } catch (e) {
        showErrorSnackBarMessage(title: 'Order Unsuccessful', message: e.toString());
      }
    }
  }

  void updateOrderSelectedItem({required String gender, required String category, required int index, required String size, required int quantity, required String color, required String returnStatus, required String orderID, required String orderItemName}) async{
    orderItemReturnID.value = orderID;
    if(orderScreenTitle.value=='Review Orders' || orderScreenTitle.value=='Delivered Orders'){
      try{
        final snapShot = await FirebaseFirestore.instance.collection('UsersOrders')
            .doc(login.currentLoggedInUser.value).get();
        if(snapShot.exists){
          orderItemDetails.value = {
            'Item Color' : 'Black',
            'Item Size' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemSize'],
            'Item Quantity' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemQuantity'],
            'Item ImageUrl' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemImageUrl'],
            'Item Name' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemName'],
            'Item Price' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemPrice'],
            'Item Short Description' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemShortDescription'],
            'Item Category' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemCategory'],
            'Item Gender' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemGender'],
            'Item FreeReturn' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemFreeReturn'],
            'Item Index' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemIndex'],
            'Item Order ID' : orderID,
            'Item Images' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemImages'],
            'Item Description' : snapShot.data()![orderID]['OrderItems'][orderItemName]['itemDescription'],
          };
        }
      }catch (e){
        showErrorSnackBarMessage(title: 'Something Went Wrong!', message: e.toString());
      }
      (returnStatus=='Free Return')? Get.toNamed('/OrderItemDetailsScreen') : showErrorSnackBarMessage(title: 'Item Not Returnable', message: 'Item Is Not Eligible For Return');
    }
  }

  void updateOrderItemRating(double value){
    orderItemRating.value = value;
  }

  void makeOrderItemReturnRequest() async{
    Map<String, dynamic> userOrders= {};
    final snapShot = await FirebaseFirestore.instance.collection('UsersOrders')
        .doc(login.currentLoggedInUser.value).get();
    userOrders = snapShot.data()!;
    for(var order in userOrders.keys){
      if(order == orderItemReturnID.value){
        print(orderItemReturnID.value);
        print(order);
        for(var item in snapShot.data()![order]['OrderItems'].keys){
          if(item!=orderItemDetails['Item Name']){
            // print(orderItemDetails['Item Name']);
            // print(item);
            userOrders[order] = {
              'Order Status' : snapShot.data()![order]['Order Status'],
              'OrderItems': {item: snapShot.data()![order]['OrderItems'][item]},
            };
          }
        }
      }else {
        // userOrders[order] = {
        //   'Order Status' : snapShot.data()![order]['Order Status'],
        //   'OrderItems' : snapShot.data()![order]['OrderItems'],
        // };
      }
    }
    // print(userOrders.keys);
    // orderReturnID.value = '${orderItemReturnID.value}-${orderItemDetails['Item Name']}-Return';
    // userOrders[orderReturnID.value] = {
    //   'Order Status' : 'Return',
    //   'OrderItems' : {
    //     orderItemDetails['Item Name'] : {
    //       'itemCategory': orderItemDetails['Item Category'],
    //       'itemColor': orderItemDetails['Item Color'],
    //       'itemFreeReturn': orderItemDetails['Item FreeReturn'],
    //       'itemGender': orderItemDetails['Item Gender'],
    //       'itemImageUrl': orderItemDetails['Item ImageUrl'],
    //       'itemIndex': orderItemDetails['Item Index'],
    //       'itemName': orderItemDetails['Item Name'],
    //       'itemPrice': orderItemDetails['Item Price'].toDouble(),
    //       'itemQuantity': orderItemDetails['Item Quantity'],
    //       'itemShortDescription': orderItemDetails['Item Short Description'],
    //       'itemSize': orderItemDetails['Item Size'],
    //     },
    //   },
    // };

    // try {
    //   await users
    //       .doc(userInfoController.currentLoggedInUser.value)
    //       .set(userOrders)
    //       .then((value) => showSuccessSnackBarMessage(title: 'Return Request Successful', message: 'Your Request Had Been Created '));
    //   Get.offNamed('/MyOrdersScreen');
    // } catch (e) {
    //   showErrorSnackBarMessage(title: 'Return Request Unsuccessful', message: e.toString());
    // }
    // getUserOnlineOrders();
    // Get.back();
  }
}