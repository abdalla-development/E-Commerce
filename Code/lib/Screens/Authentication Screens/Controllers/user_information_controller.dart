import 'package:get/get.dart';

class UserInformationScreenController extends GetxController{
  final firstName = ''.obs;
  final lastName = ''.obs;
  final genderType = 'male'.obs;
  final username = ''.obs;
  final userMobileNumber = ''.obs;
  final userEmail = ''.obs;
  final userCity = ''.obs;
  final maleGenderIsChecked = true.obs;
  final femaleGenderIsChecked = false.obs;
  final currentLoggedInUser = ''.obs;
  final showLoadingSpinner = false.obs;
  final firstNameLabel = ''.obs;
  final lastNameLabel = ''.obs;
  final usernameLabel = ''.obs;
  final userMobileLabel = ''.obs;
  final userEmailLabel = ''.obs;
  final userCityLabel = ''.obs;
  final inputsValid = false.obs;
  final mobileIsValid = false.obs;

  void updateFirstName(String value){
    firstName.value = value;
  }

  void updateFirstNameLabel(String value){
    firstNameLabel.value = value;
  }

  void updateLastName(String value){
    lastName.value = value;
  }

  void updateLastNameLabel(String value) {
    lastNameLabel.value = value;
  }

  void updateUsername(String value){
    username.value = value;
  }

  void updateUsernameLabel(String value) {
    usernameLabel.value = value;
  }

  void updateCity(String value){
    userCity.value = value;
  }

  void updateCityLabel(String value) {
    userCityLabel.value = value;
  }

  void updateUserMobileNumber(String value){
    userMobileNumber.value = value;
  }

  void updateUserMobileLabel(String value) {
    userMobileLabel.value = value;
  }

  void updateUserEmailAddress(String value){
    userEmail.value = value;
  }

  void updateUserEmailLabel(String value) {
    userEmailLabel.value = value;
  }

  void toggleGenderType (){
    maleGenderIsChecked.value = !maleGenderIsChecked.value;
    femaleGenderIsChecked.value = !femaleGenderIsChecked.value;
  }

  void updateGenderType(String value){
    genderType.value = value;
  }

  void toggleLoadingSpinner(){
    showLoadingSpinner.value = !showLoadingSpinner.value;
  }

  void updateCurrentLoggedInUser(String value){
    currentLoggedInUser.value = value;
  }

  void checkInputsValid(){
    Pattern pattern = r'^(\+|00)[1-9][0-9 \-\(\)\.]{7,32}$';
    RegExp regex =  RegExp(pattern.toString());
    (!regex.hasMatch(userMobileNumber.value))? mobileIsValid.value = false : mobileIsValid.value = true;
    if(firstName.value!=''&&lastName.value!=''&&username.value!=''&&mobileIsValid.value&&userCity.value!=''){
      inputsValid.value = true;
    }else if(firstName.value==''){
      inputsValid.value = false;
      showLoadingSpinner.value = false;
      firstNameLabel.value = 'You Need To Enter Your First Name';
    }else if(lastName.value==''){
      inputsValid.value = false;
      showLoadingSpinner.value = false;
      lastNameLabel.value = 'You Need To Enter Your Last Name';
    }else if(username.value==''){
      inputsValid.value = false;
      showLoadingSpinner.value = false;
      usernameLabel.value = 'You Need To Enter A Username';
    }else if(userCity.value==''){
      inputsValid.value = false;
      showLoadingSpinner.value = false;
      userCityLabel.value = 'You need To Provide Your City';
    }else{
      showLoadingSpinner.value = false;
    }
  }
}