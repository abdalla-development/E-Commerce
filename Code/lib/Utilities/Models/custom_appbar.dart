import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Screens/Store Screen/Controllers/store_screen_controller.dart';
import '../Configurations/constants.dart';
import 'package:get/get.dart';

final storeController = Get.find<StoreScreenController>();

AppBar customAppBar({required bool hasBackIcon, required Function onPressed, required bool isUserAccountScreen, required String title}){
  return AppBar(
    leading: (hasBackIcon && !isUserAccountScreen)?IconButton(
      onPressed: (){
        onPressed();
      },
      icon: const Icon(FontAwesomeIcons.arrowLeft),
    ):null,
    title: (!isUserAccountScreen)? SizedBox(
      height: 40,
      child: TextField(
        decoration: kSearchBarTextFieldDecoration.copyWith(
          prefixIcon: IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
          hintText: 'Search for ',
          labelStyle: const TextStyle(
            color: Colors.red,
          ),
        ),
        textAlignVertical: TextAlignVertical.bottom,
      ),
    ):Text(
      title,
      style: GoogleFonts.lobster(
        fontSize: 40.0,
        color: Colors.grey,
      ),
    ),
  );
}