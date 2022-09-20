import 'package:get/get.dart';
import '../../../Utilities/Methods/Firebase/get_store_data.dart';
import '../../Authentication Screens/Controllers/authentication_screens_controller.dart';
import '../../Authentication Screens/Controllers/change_password_controller.dart';
import '../../Authentication Screens/Controllers/login_controller.dart';
import '../../Authentication Screens/Controllers/register_controller.dart';
import '../../Authentication Screens/Controllers/user_information_controller.dart';
import '../../Cart Screen/Controllers/cart_screen_controller.dart';
import '../../Home Screen/Controllers/home_screen_controller.dart';
import '../../Home Screen/Controllers/user_favorites_list_controller.dart';
import '../../Home Screen/Controllers/user_orders_controller.dart';
import '../../Home Screen/Controllers/user_returns_controller.dart';
import '../../Item Details Screen/Controllers/item_details_screen_controller.dart';
import '../../Store Screen/Controllers/store_boys_data_controller.dart';
import '../../Store Screen/Controllers/store_girls_data_controller.dart';
import '../../Store Screen/Controllers/store_men_data_controller.dart';
import '../../Store Screen/Controllers/store_screen_controller.dart';
import '../../Store Screen/Controllers/store_women_data_controller.dart';
import '../../User Profile Screen/Controllers/notifications_settings_controller.dart';
import '../../User Profile Screen/Controllers/user_account_screen_controller.dart';
import '../../User Profile Screen/Controllers/user_information_update_controller.dart';
import '../../User Profile Screen/Controllers/user_payment_information_controller.dart';
import '../../User Profile Screen/Controllers/user_ratings_controller.dart';
import '../../User Profile Screen/Controllers/user_shipping_addresses_controller.dart';
import '../Controllers/network_connection_controller.dart';

class SplashScreenBinding extends Bindings{
  @override
  void dependencies() async{
    // TODO: implement dependencies
    Get.put(CartController());
    Get.put(StoreScreenController());
    Get.put(HomeController());
    Get.put(UserAccountController());
    Get.put(StoreMenDataController());
    Get.put(StoreWomenDataController());
    Get.put(StoreBoysDataController());
    Get.put(StoreGirlsDataController());
    Get.put(ItemDetailsScreenController());
    Get.put(UserReturnsController());
    Get.put(UserOrdersController());
    Get.put(UserFavoritesListController());
    Get.put(AuthenticationScreensController());
    Get.put(LoginController());
    Get.put(RegisterController());
    Get.put(ChangePasswordController());
    Get.put(UserInformationScreenController());
    Get.put(UserInformationUpdateController());
    Get.put(UsersRatingController());
    Get.put(NotificationsSettingsController());
    Get.put(UserShippingAddressesController());
    Get.put(UserPaymentInformationController());
    Get.put(NetworkConnectionController());
    getOnlineStoreData();
  }
}
