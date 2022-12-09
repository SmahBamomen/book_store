
import 'package:get/get.dart';

class CheckboxController extends GetxController {
  bool isCheckBox =false;
  void checkBox(){
    isCheckBox =! isCheckBox ;
    update();
  }
}

