import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../Controllers/user_ratings_controller.dart';

class WasTheAppEasyToUse extends StatelessWidget {
   WasTheAppEasyToUse({Key? key}) : super(key: key);

   final ratingController = Get.find<UsersRatingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Was The App Easy To Use?', style: TextStyle(fontSize: 15),),
          Column(
            children: [
              Text(ratingController.appEasyToUseRate.value.toString(), style: const TextStyle(fontSize: 18),),
              RatingBar.builder(
                itemBuilder: (context, _)=> const Icon(Icons.star, color: Colors.amber,),
                onRatingUpdate: (rating){
                  ratingController.updateAppEasyToUseRating(rating);
                },
                updateOnDrag: true,
                minRating: 1,
                itemSize: 28,
                initialRating: ratingController.appEasyToUseRate.value,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1),
                // minRating = 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
