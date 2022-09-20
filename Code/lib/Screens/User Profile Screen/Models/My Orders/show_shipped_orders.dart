import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Home Screen/Controllers/user_orders_controller.dart';


class ShowShippedOrders extends StatelessWidget {
   ShowShippedOrders({Key? key}) : super(key: key);

   final orderController = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        orderController.updateOrderScreenDataToShow(screenToShow: 'Shipped', screenTitle: 'Shipped Orders');
      },
      child: Column(
        children: [
          ClipOval(
            child: CircleAvatar(
              radius: 50,
              child: Image.asset(
                'Images/Local/orders_shipped.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8,),
          const Text('Shipped'),
        ],
      ),
    );
  }
}
