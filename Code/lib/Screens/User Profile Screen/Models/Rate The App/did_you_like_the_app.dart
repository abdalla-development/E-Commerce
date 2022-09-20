import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../Controllers/user_ratings_controller.dart';

class DidYouLikeTheApp extends StatelessWidget {
   DidYouLikeTheApp({Key? key}) : super(key: key);

   final ratingController = Get.find<UsersRatingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('How Did You Like The App?', style: TextStyle(fontSize: 15),),
          Column(
            children: [
              Text(ratingController.appLikeRate.value.toString(), style: const TextStyle(fontSize: 18),),
              RatingBar.builder(
                itemBuilder: (context, _)=> const Icon(Icons.star, color: Colors.amber,),
                onRatingUpdate: (rating){
                  ratingController.updateAppLikeRate(rating);
                },
                updateOnDrag: true,
                minRating: 1,
                itemSize: 28,
                initialRating: ratingController.appLikeRate.value,
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
