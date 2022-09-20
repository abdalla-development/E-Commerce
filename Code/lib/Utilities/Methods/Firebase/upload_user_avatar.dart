import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:shopping/Utilities/Methods/Firebase/save_selected_user_avatar.dart';
import '../../../Screens/Authentication Screens/Controllers/login_controller.dart';
import '../Alert/error_snackBar_message.dart';

final loginScreenController = Get.find<LoginController>();

void uploadUserAvatar() async{
  final photo = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['png', 'jpg']
  );
  if (photo == null){
    showErrorSnackBarMessage(
        title: 'Empty File',
        message: 'Sorry No File Was Selected',
    );
  }
  final path = photo?.files.single.path;
  loginScreenController.loadUserAvatarPath(path!);
  saveSelectedUserAvatar();
}