import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Home Screen/Controllers/user_favorites_list_controller.dart';
import '../Controllers/item_details_screen_controller.dart';
import 'package:card_swiper/card_swiper.dart';

class ItemCarouselSlider extends StatelessWidget {
  ItemCarouselSlider({Key? key}) : super(key: key);

  final itemController = Get.find<ItemDetailsScreenController>();
  final favorites = Get.find<UserFavoritesListController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.shareNodes),
            ),
          ),
          Swiper(
            itemBuilder: (BuildContext context, int index) {
              return CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: itemController.itemData['Images'][index],
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
            itemCount: itemController.imageCarouselImages.length,
            itemWidth: 360.0,
            itemHeight: 350.0,
            layout: SwiperLayout.TINDER,
            pagination: const SwiperPagination(
                margin: EdgeInsets.only(top: 370.0),
            ),
              indicatorLayout: PageIndicatorLayout.COLOR,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                favorites.addDeleteItem(
                    item: itemController.itemData,
                    category: itemController.category.value,
                    index: itemController.index.value,
                    gender: itemController.gender.value);
              },
              icon: (favorites.itemIsAddedToFavorites.value)
                  ? const Icon(
                FontAwesomeIcons.heartCircleMinus,
                color: Color(0XC9B93160),
              )
                  : const Icon(
                FontAwesomeIcons.heartCirclePlus,
                color: Color(0XFFCFD2CF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
