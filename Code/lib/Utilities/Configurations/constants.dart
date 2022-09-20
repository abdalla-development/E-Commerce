import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../Screens/Home Screen/Controllers/home_screen_controller.dart';

final homeScreen = Get.find<HomeController>();

const kSearchBarTextFieldDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 20),
  labelStyle: TextStyle(color: Colors.grey),
  iconColor: Colors.black,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusColor: Colors.grey,
);

List<TabItem> tabItems = List.of([
  TabItem(
    FontAwesomeIcons.house,
    "Home",
    const Color(0xff3A3845),
    labelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: Colors.black54,
        decoration: TextDecoration.none),
  ),
  TabItem(
    FontAwesomeIcons.shop,
    "Store",
    const Color(0xe3F8B400),
    labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black54,
        decoration: TextDecoration.none),
  ),
  TabItem(
    FontAwesomeIcons.cartShopping,
    "Cart",
    const Color(0xff8E806A),
    labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black54,
        decoration: TextDecoration.none),
  ),
  TabItem(
    FontAwesomeIcons.user,
    "Me",
    const Color(0xff464E2E),
    labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Colors.black54,
        decoration: TextDecoration.none),
  ),
]);

ButtonStyle kCheckOutButtonStyle = ElevatedButton.styleFrom(
  primary: const Color(0xffFEC260),
  onPrimary: const Color(0xff100720),
  elevation: 3,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(32.0),
  ),
  minimumSize: const Size(250, 40), //////// HERE
);

Divider divider = const Divider(
  color: Color(0xFF818589),
  thickness: 2.5,
  indent: 20.0,
  endIndent: 20.0,
);

ButtonStyle kSeeMoreButtonStyle = ElevatedButton.styleFrom(
  primary: const Color(0x4D42855B),
  onPrimary:  Colors.black54,
  elevation: 1,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
  ),
  minimumSize: const Size(200, 40), //////// HERE
);

ButtonStyle kSingInButtonStyle = ElevatedButton.styleFrom(
  primary: const Color(0x4D0078AA),
  onPrimary:  const Color(0XFF15133C),
  elevation: 1,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(18.0),
  ),
  minimumSize: const Size(200, 40), //////// HERE
);

const kTextFieldDecoration = InputDecoration(
  // prefixIcon: Icon(FontAwesomeIcons.userLarge),
  // hintText: 'First Name',
  labelStyle: TextStyle(color: Colors.grey),
  iconColor: Colors.black,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30.0),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.black, width: 1.0),
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.grey, width: 2.0),
    borderRadius:
    BorderRadius.all(Radius.circular(32.0)),
  ),
  focusColor: Colors.grey,
);

const kAppBodyBackgroundColor = Color(0X1A8E8E8E);
