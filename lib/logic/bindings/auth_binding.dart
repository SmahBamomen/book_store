import 'package:book_store/logic/controllers/responsive_ui_controller.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';



class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put<ResponsiveUiController>(ResponsiveUiController());

  }
}