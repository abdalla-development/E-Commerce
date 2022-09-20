import 'package:flutter/material.dart';

class TopPicksItem extends StatelessWidget {
   TopPicksItem({Key? key, required this.itemImageURl}) : super(key: key);

   String itemImageURl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            itemImageURl,
            height: 150,
          ),
        ),
        const SizedBox(width: 30,),
        Column(
          children: const [
            SizedBox(height: 20,),
            Text('Up to 38%', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Text('Save on boys', style: TextStyle(fontSize: 16),),
          ],
        ),
      ],
    );
  }
}
