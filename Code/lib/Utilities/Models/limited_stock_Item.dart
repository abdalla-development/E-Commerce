import 'package:flutter/material.dart';

class LimitedStockItem extends StatelessWidget {
  LimitedStockItem(
      {Key? key,
      required this.itemImageURL,
      required this.itemSavings,
      required this.itemsLeftNumber,
      required this.itemSaveOnGender,
      required this.itemsPrice})
      : super(key: key);

  String itemImageURL;
  String itemSavings;
  String itemSaveOnGender;
  int itemsLeftNumber;
  int itemsPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            itemImageURL,
            height: 150,
          ),
        ),
        const SizedBox(
          width: 35,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(itemSavings, style: const TextStyle(fontSize: 18),),
            const SizedBox(height: 10),
            Text(itemSaveOnGender, style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 10),
            Text('only $itemsLeftNumber left', style: const TextStyle(fontSize: 16),),
            const SizedBox(height: 10),
            Text('${itemsPrice.toString()} USD', style: const TextStyle(fontSize: 20),),
          ],
        ),
      ],
    );
  }
}
