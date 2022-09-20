import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Home Screen/Controllers/user_orders_controller.dart';

class ShowReviewOrders extends StatelessWidget {
   ShowReviewOrders({Key? key}) : super(key: key);

   final orderController = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        orderController.updateOrderScreenDataToShow(screenToShow: 'Review', screenTitle: 'Review Orders');
      },
      child: Column(
        children: [
          ClipOval(
            child: CircleAvatar(
              radius: 50,
              child: Image.asset(
                'Images/Local/orders_review.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8,),
          const Text('Review'),
        ],
      ),
    );
  }
}
