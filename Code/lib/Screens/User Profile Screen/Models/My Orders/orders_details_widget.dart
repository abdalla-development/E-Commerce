import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Home Screen/Controllers/user_orders_controller.dart';

class OrderSDetailsWidget extends StatelessWidget {
  OrderSDetailsWidget({Key? key}) : super(key: key);

   final orderController = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Row(
            children: const [
              Text('No.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
              SizedBox(width: 15),
              Text('Order ID', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),),
            ],
          ),
          const SizedBox(height: 10),
          Obx(
                ()=> SingleChildScrollView(
              child: SizedBox(
                height: 570,
                child: ListView.builder(
                  itemCount: orderController
                      .orderDataToShow.length,
                  itemBuilder:
                      (BuildContext context, int orderIndex) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Text('${orderIndex + 1}-', style: const TextStyle(fontSize: 16, color: Colors.blueGrey)),
                            const SizedBox(width: 28),
                            Expanded(
                                flex: 5,
                                child: Text(orderController.orderDataToShow.keys.toList()[orderIndex], style: const TextStyle(fontSize: 16, color: Colors.blueGrey))),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          margin: const EdgeInsets.symmetric( vertical: 20),
                          padding:
                          const EdgeInsets.symmetric(
                              vertical: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blueGrey,
                                width: 2),
                            borderRadius:
                            BorderRadius.circular(16),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: orderController.orderDataToShow[orderController.orderDataToShow.keys.toList()[orderIndex]],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
