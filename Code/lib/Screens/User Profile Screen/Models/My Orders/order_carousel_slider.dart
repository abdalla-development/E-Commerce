import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../Home Screen/Controllers/user_orders_controller.dart';


class OrderCarouselSlider extends StatelessWidget {
   OrderCarouselSlider({Key? key}) : super(key: key);

   final orderController = Get.find<UserOrdersController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Swiper(
            itemBuilder: (BuildContext context, int index) {
              return CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: orderController.orderItemDetails['Item Images'][index],
                errorWidget: (context, url, error) => Image.asset(
                  'Images/Local/place_holder.png',
                ),
                placeholder: (context, url) =>  CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.greenAccent.withAlpha(100),
                  strokeWidth: 1,
                ),
              );
            },
            itemCount: orderController.orderItemDetails['Item Images'].length,
            itemWidth: 360.0,
            itemHeight: 350.0,
            layout: SwiperLayout.TINDER,
            pagination: const SwiperPagination(
              margin: EdgeInsets.only(top: 370.0),
            ),
            indicatorLayout: PageIndicatorLayout.COLOR,
          ),
    );
  }
}
