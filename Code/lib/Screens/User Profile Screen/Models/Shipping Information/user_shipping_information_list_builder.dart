import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../Utilities/Methods/Shipping/delete_shipping_address.dart';
import '../../../../Utilities/Methods/Shipping/edit_shipping_address.dart';
import '../../../../Utilities/Methods/Shipping/set_shipping_address_as_default.dart';
import '../../Controllers/user_shipping_addresses_controller.dart';

class UserShippingInformationListBuilder extends StatelessWidget {
   UserShippingInformationListBuilder({Key? key}) : super(key: key);

   final shippingAddresses = Get.find<UserShippingAddressesController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> ListView.builder(
        itemCount: shippingAddresses.addresses.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(
                  '${index+1}.',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    shippingAddresses.addresses[index.toString()]['Title'],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 15),
                (shippingAddresses.addresses[index.toString()]['Default'])? const Text('Default', style: TextStyle(color: Colors.greenAccent),):  GestureDetector(
                  onTap: (){
                    setShippingAddressAsDefault(index);
                  },
                  child: const Text('Set Default', style: TextStyle(color: Colors.grey),),
                ),
                IconButton(
                  onPressed: () {
                    editShippingAddress(index: index, context: context);
                  },
                  icon: const Icon(FontAwesomeIcons.pen, color: Colors.blueGrey,),
                ),
                IconButton(
                  onPressed: () {
                    deleteShippingAddress(index);
                  },
                  icon: const Icon(FontAwesomeIcons.trash, color: Colors.amber,),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
