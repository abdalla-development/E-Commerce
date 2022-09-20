import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/Shipping/add_shipping_address.dart';
import '../../../User Profile Screen/Controllers/user_shipping_addresses_controller.dart';


class ConfirmOrderShippingAddresses extends StatelessWidget {
   ConfirmOrderShippingAddresses({Key? key}) : super(key: key);

   final shipping = Get.find<UserShippingAddressesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 15, vertical: 5),
        padding: const EdgeInsets.symmetric(
            horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            (shipping.userDefaultShippingAddress.isEmpty)?const Text('No Default Shipping Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),) :  Text('- ${shipping.userDefaultShippingAddress['Title']} - ${shipping.userDefaultShippingAddress['Postal Code']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),),
            (shipping.addresses.length>1)? Row(
              children: [
                GestureDetector(
                    onTap: (){
                      addShippingAddress(context);
                    },
                    child: const Text('add', style: TextStyle(color: Colors.blueAccent, fontSize: 16, decoration: TextDecoration.underline,),)
                ),
                const SizedBox(width: 8),
                FocusedMenuHolder(
                  blurBackgroundColor: Colors.blueGrey[900],
                  openWithTap: true,
                  menuOffset: 20,
                  menuItems: shipping.addressesSelection,
                  onPressed: (){},
                  child: const Text('Change', style: TextStyle(color: Colors.blueAccent, fontSize: 16, decoration: TextDecoration.underline,),),
                ),
              ],
            ) :
            GestureDetector(
              onTap: (){
                addShippingAddress(context);
              },
              child: const Text('Add', style: TextStyle(color: Colors.blueAccent, fontSize: 16, decoration: TextDecoration.underline,),),
            ),
          ],
        ),
      ),
    );
  }
}
