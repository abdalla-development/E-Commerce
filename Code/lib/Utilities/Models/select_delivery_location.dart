import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Screens/Cart Screen/Controllers/cart_screen_controller.dart';
import '../../Screens/User Profile Screen/Controllers/user_shipping_addresses_controller.dart';

class SelectDeliveryLocation extends StatelessWidget {
    SelectDeliveryLocation({Key? key}) : super(key: key);

    final cartController = Get.find<CartController>();
    final shipping = Get.find<UserShippingAddressesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Container(
        color: Colors.blueGrey,
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: ListTile(
          leading: const Icon(FontAwesomeIcons.locationDot),
          title: FocusedMenuHolder(
            // MEN
            blurBackgroundColor: Colors.blueGrey[900],
            openWithTap: true,
            menuOffset: 20,
            menuItems: shipping.addressesSelection,
            onPressed: (){},
            child: (shipping.userDefaultShippingAddress.isEmpty)? const Text('Select Delivery Location') : Text('${shipping.userDefaultShippingAddress['Title']} - ${shipping.userDefaultShippingAddress['Postal Code']}'),
          ),
          trailing: SizedBox(
            width: 80,
            child: Row(
              children: [
                FocusedMenuHolder(
                  blurBackgroundColor: Colors.blueGrey[900],
                  openWithTap: true,
                  menuOffset: 50,
                  menuItemExtent: 50,
                  menuItems: [
                    FocusedMenuItem(
                      onPressed: (){},
                      title: const Text('Sort Price High - Low'),
                    ),
                    FocusedMenuItem(
                      onPressed: (){},
                      title: const Text('Sort Price Low - High'),
                    ),
                  ],
                  onPressed: (){},
                  child: const Icon(FontAwesomeIcons.barsStaggered, color: Colors.grey,),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    Get.toNamed('/CartScreen');
                  },
                  icon: Stack(
                    children:   [
                      const Icon(FontAwesomeIcons.cartShopping, color: Colors.grey,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(cartController.cartItemsCount.value.toString(), style: const TextStyle(fontSize: 18, color: Colors.redAccent),),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
