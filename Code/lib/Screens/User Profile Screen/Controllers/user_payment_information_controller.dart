import 'package:focused_menu/modals.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../Authentication Screens/Controllers/login_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final login = Get.find<LoginController>();

class UserPaymentInformationController extends GetxController {
  final cardTitle = ''.obs;
  final cardTitleLabel = ''.obs;
  final cardHolderName = ''.obs;
  final cardHolderNameLabel = ''.obs;
  final cardNumber = ''.obs;
  final cardNumberLabel = ''.obs;
  final cardMonthExpiration = 0.obs;
  final cardMonthExpirationLabel = ''.obs;
  final cardYearExpiration = 0.obs;
  final cardYearExpirationLabel = ''.obs;
  final userCards = {}.obs;
  final inputsValid = false.obs;
  final cardNumberValid = false.obs;
  final monthExpirationValid = false.obs;
  final yearExpirationValid = false.obs;
  final cardsSnapShot = {}.obs;
  final cardIsDefault = false.obs;
  final updateCard = false.obs;
  final userDefaultPaymentCard = {}.obs;
  List<FocusedMenuItem> cardSelection = [];

  void updateCardTitle(String value) {
    cardTitle.value = value;
  }

  void updateCardTitleLabel(String value) {
    cardTitleLabel.value = value;
  }

  void updateCardHolderName(String value) {
    cardHolderName.value = value;
  }

  void updateCardHolderNameLabel(String value) {
    cardHolderNameLabel.value = value;
  }

  void updateCardNumber(String value) {
    cardNumber.value = value;
  }

  void updateCardNumberLabel(String value) {
    cardNumberLabel.value = value;
  }

  void updateMonthExpiration(String value) {
    cardMonthExpiration.value = int.parse(value);
  }

  void updateMonthExpirationLabel(String value) {
    cardMonthExpirationLabel.value = value;
  }

  void updateYearExpiration(String value) {
    cardYearExpiration.value = int.parse(value);
  }

  void updateYearExpirationLabel(String value) {
    cardYearExpirationLabel.value = value;
  }

  void checkInputsValid() {
    checkCardNumberValid();
    checkMonthExpirationValid();
    checkYearExpirationValid();
    if (cardTitle.value != '' &&
        cardHolderName.value != '' &&
        cardNumber.value != '' &&
        cardMonthExpiration.value != 0 &&
        cardYearExpiration.value != 0 &&
        cardNumberValid.value &&
    monthExpirationValid.value &&
    yearExpirationValid.value
    ) {
      inputsValid.value = true;
    }else if(cardTitle.value == ''){
      cardTitleLabel.value = 'You Need To Provide A Card Title';
    }else if(cardHolderName.value == ''){
      cardHolderNameLabel.value = 'You Need To Provide The Holder Name';
    }else if(cardMonthExpiration.value == 0){
      cardMonthExpirationLabel.value = 'You Need To Provide Card Month Expiration';
    }else if(cardNumber.value == ''){
      cardNumberLabel.value = 'You Need To Provide The Card Number';
    }else if(cardYearExpiration.value == 0){
      cardYearExpirationLabel.value = 'You Need To Provide Card Year Expiration';
    }else if(!cardNumberValid.value){
      cardNumberLabel.value = 'You Need To Provide A Valid Card Number';
    }else if(!monthExpirationValid.value){
      cardMonthExpirationLabel.value = 'You Need To Provide A Valid Card Month Expiration';
    }else if(!yearExpirationValid.value){
      cardYearExpirationLabel.value = 'You Need To Provide A Valid Card Year Expiration';
    }
  }

  void checkCardNumberValid() {
    Pattern pattern = r'^(?:4[0-9]{12}(?:[0-9]{3})?|[25][1-7][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$';
    RegExp regex = RegExp(pattern.toString());
    (!regex.hasMatch(cardNumber.value))
        ? cardNumberValid.value = false
        : cardNumberValid.value = true;
  }

  void clearPaymentData(){
    cardTitle.value = '';
    cardTitleLabel.value = '';
    cardHolderName.value = '';
    cardHolderNameLabel.value = '';
    cardNumber.value = '';
    cardNumberLabel.value = '';
    cardMonthExpiration.value = 0;
    cardMonthExpirationLabel.value = '';
    cardYearExpiration.value = 0;
    cardYearExpirationLabel.value = '';
    inputsValid.value = false;
    cardNumberValid.value = false;
    monthExpirationValid.value = false;
    yearExpirationValid.value = false;
    updateCard.value = false;
  }

  void checkMonthExpirationValid() {
    if(cardMonthExpiration.value>0 && cardMonthExpiration.value<=12){
      monthExpirationValid.value = true;
    }
  }

  void checkYearExpirationValid() {
    if(cardYearExpiration.value>0){
      yearExpirationValid.value = true;
    }
  }

  void loadUserPaymentInformation() async {
    // userCards.clear();
    // await for (var snapShot in FirebaseFirestore.instance
    //     .collection('UsersPaymentInformation')
    //     .snapshots()) {
    //   for (var userDocument in snapShot.docs) {
    //     if (userDocument.id == login.currentLoggedInUser.value) {
    //       cardsSnapShot.value = userDocument.data();
    //       loadCardsInformation();
    //     }
    //   }
    // }
  }

  void loadCardsInformation(){
    // for (var obj in cardsSnapShot.keys) {
    //   userCards[obj] = cardsSnapShot[obj];
    //   if(cardsSnapShot[obj]['Default Card'] || cardsSnapShot.length==1){
    //     userDefaultPaymentCard.value = cardsSnapShot[obj];
    //   }
    // }
  }

  void loadEditCardData({required String title, required String holderName, required String number, required int month, required int year, required bool isDefault}){
    // cardTitle.value = title;
    // cardHolderName.value = holderName;
    // cardNumber.value = number;
    // cardMonthExpiration.value = month;
    // cardYearExpiration.value = year;
    // cardIsDefault.value = isDefault;
  }

  void updateCurrentCard(){
    updateCard.value = true;
  }

  void loadCurrentCardSelection() {
    // cardSelection.clear();
    // FocusedMenuItem focusedMenuItemTitle = FocusedMenuItem(
    //   onPressed: () {},
    //   title: const Text('Select Card'),
    // );
    // cardSelection.add(focusedMenuItemTitle);
    //
    // for (var obj in userCards.keys) {
    //   FocusedMenuItem focusedMenuItem =FocusedMenuItem(
    //     onPressed: () async {
    //       userDefaultPaymentCard.value = userCards[obj];
    //     },
    //     title:  Text(userCards[obj]['Card Title']),
    //     trailingIcon: const Icon(FontAwesomeIcons.creditCard),
    //   );
    //   cardSelection.add(focusedMenuItem);
    // }
  }
}
