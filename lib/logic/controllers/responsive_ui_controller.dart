import 'package:book_store/utils/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

//import 'package:responsive_sizer/responsive_sizer.dart';



class ResponsiveUiController extends GetxController {
  var responsiveAttributes;

  ResponsiveUiController() {

    if (kIsWeb) {
      responsiveAttributes = Web();
    } else if (Platform.isIOS || Platform.isAndroid) {
      responsiveAttributes = Mobile();
    } else {
      responsiveAttributes = Web();
    }

    /*
     //alternative implementation, assign sizes using the device.width
     //this will cover all types of screens from desktop, tablet, to mobile

     if (Device.width < 1000) {
     responsiveAttributes = Mobile();
     } else  {
      responsiveAttributes = Web();
     }
     */
  }

}
