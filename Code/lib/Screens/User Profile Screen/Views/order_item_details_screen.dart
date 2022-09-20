import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../Utilities/Configurations/constants.dart';
import '../../../Utilities/Models/bottom_navigation_bar.dart';
import '../../../Utilities/Models/custom_appbar.dart';
import '../../../Utilities/Models/spinner.dart';
import '../../Home Screen/Controllers/user_orders_controller.dart';
import '../Controllers/user_account_screen_controller.dart';
import '../Models/My Orders/order_carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderItemDetailsScreen extends StatelessWidget {
  OrderItemDetailsScreen({Key? key}) : super(key: key);

  final userAccountController = Get.find<UserAccountController>();
  final orderController = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            extendBody: true,
            extendBodyBehindAppBar: true,
            appBar: customAppBar(
                hasBackIcon: true,
                onPressed: () {
                  Get.back();
                },
                isUserAccountScreen: false,
                title: ''),
            body: Container(
              color: kAppBodyBackgroundColor,
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            orderController.orderItemDetails['Item Name'],
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xff2B4865),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            orderController.orderItemDetails['Item Short Description'],
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xff7F8487),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        OrderCarouselSlider(),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff5F7161)),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                '${orderController.orderItemDetails['Item Price']} SAR',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff5F7161)),
                              ),
                              const SizedBox(width: 20),
                              (orderController.orderItemDetails['Item Quantity']==1)?Text(
                                orderController.orderItemDetails['Item Quantity']
                                    .toString(),
                                style: const TextStyle(fontSize: 20),
                              ) : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        // if(itemController.itemSelectedQuantity.value>1){
                                        //   itemController.updateItemSelectedQuantity(itemController.itemSelectedQuantity.value-1);
                                        // }
                                      },
                                      icon: const Icon(FontAwesomeIcons.minus),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  // Text(orderController.orderItemDetails['Item Quantity']
                                  //     .toString()),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        // itemController.updateItemSelectedQuantity(itemController.itemSelectedQuantity.value+1);
                                      },
                                      icon: const Icon(FontAwesomeIcons.plus),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              const Text(
                                'Color',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff5F7161)),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                orderController.orderItemDetails['Item Color'],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            children: [
                              const Text(
                                'Size',
                                style: TextStyle(
                                    fontSize: 20, color: Color(0xff5F7161)),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                orderController.orderItemDetails['Item Size'],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        // const Padding(
                        //   padding: EdgeInsets.symmetric(horizontal: 25),
                        //   child: Text(
                        //     'Description',
                        //     style: TextStyle(
                        //         fontSize: 24, fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                        // const SizedBox(height: 15),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 25),
                        //   child: Text(
                        //     orderController.orderItemDetails['Order Item']
                        //         ['Description'],
                        //     style: const TextStyle(fontSize: 16),
                        //   ),
                        // ),
                        const SizedBox(height: 15),
                        (orderController.orderScreenTitle.value ==
                                'Review Orders')
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 25),
                                child: Column(
                                  children: [
                                    TextField(
                                      decoration: kTextFieldDecoration.copyWith(
                                        hintText: 'Write Your Review',
                                        labelText: (userAccountController
                                                    .contactUsMessageBodyLabel
                                                    .value !=
                                                '')
                                            ? userAccountController
                                                .contactUsMessageBodyLabel.value
                                            : null,
                                        labelStyle:
                                            const TextStyle(color: Colors.red),
                                      ),
                                      minLines: 5,
                                      maxLines: 20,
                                      keyboardType: TextInputType.text,
                                      onChanged: (value) {
                                        userAccountController
                                            .updateContactUsBody(value);
                                        userAccountController
                                            .updateContactUsBodyLabel('');
                                      },
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RatingBar.builder(
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            orderController.updateOrderItemRating(rating);
                                          },
                                          updateOnDrag: true,
                                          minRating: 1,
                                          itemSize: 28,
                                          initialRating: orderController.orderItemRating.value,
                                          itemPadding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          // minRating = 1,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(orderController.orderItemRating.value.toString()),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                      style: kSingInButtonStyle,
                                      onPressed: () {},
                                      child: const Text('Submit'),
                                    ),
                                  ],
                                ),
                              )
                            : (orderController.orderScreenTitle.value ==
                                    'Delivered Orders')
                                ? Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: Column(
                          children: [
                            TextField(
                              decoration: kTextFieldDecoration.copyWith(
                                  hintText: 'Write Your Reason For Return',
                                  labelText: (userAccountController
                                      .contactUsMessageBodyLabel
                                      .value !=
                                      '')
                                      ? userAccountController
                                      .contactUsMessageBodyLabel.value
                                      : null,
                                  labelStyle:
                                  const TextStyle(color: Colors.red),
                              ),
                              minLines: 5,
                              maxLines: 20,
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                  userAccountController
                                      .updateContactUsBody(value);
                                  userAccountController
                                      .updateContactUsBodyLabel('');
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              style: kSingInButtonStyle,
                              onPressed: () {
                                orderController.makeOrderItemReturnRequest();
                              },
                              child: const Text('Return Item'),
                            )
                          ],
                        ),
                                )
                                : Container(),
                        const SizedBox(height: 90),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(),
          ),
          (userAccountController.showSpinner.value)
              ? const Spinner()
              : Container(),
        ],
      ),
    );
  }
}
