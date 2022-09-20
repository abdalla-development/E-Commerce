import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../Controllers/user_ratings_controller.dart';

class HowWereYouSatisfied extends StatelessWidget {
   HowWereYouSatisfied({Key? key}) : super(key: key);

   final ratingController = Get.find<UsersRatingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('How Were You Satisfied?', style: TextStyle(fontSize: 15),),
          Column(
            children: [
              Text(ratingController.appUserSatisfactionRate.value.toString(), style: const TextStyle(fontSize: 18),),
              RatingBar.builder(
                itemBuilder: (context, _)=> const Icon(Icons.star, color: Colors.amber,),
                onRatingUpdate: (rating){
                  ratingController.updateAppUserSatisfactionRating(rating);
                },
                updateOnDrag: true,
                minRating: 1,
                initialRating: ratingController.appUserSatisfactionRate.value,
                itemSize: 28,
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
