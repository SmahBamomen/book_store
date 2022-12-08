
import 'package:book_store/views/screens/admin/Add_product_form_screen.dart';
import 'package:book_store/views/screens/admin/stock_screen.dart';
import 'package:book_store/views/screens/forgot_password_screen.dart';
import 'package:book_store/views/screens/login_screen.dart';
import 'package:book_store/views/screens/signup_screen.dart';
import 'package:book_store/views/screens/user/customer_home.dart';
import 'package:get/route_manager.dart';

import 'logic/bindings/app_binding.dart';

class AppRoutes {
  static const login = Routes.loginScreen;
  static const stock = Routes.stockScreen;
  //static const login = Routes.logIn;
  static const addProduct = Routes.logIn;
  static const customerHome = Routes.customerHome;
  static final routes = [
    GetPage(
        name: Routes.loginScreen,
        page: () => Login_Screen(),
        binding: AppBinding()),
    GetPage(
        name: Routes.signScreen,
        page: () => SignUpScreen(),
        binding: AppBinding()),
    GetPage(
        name: Routes.forgotpasswordScreen,
        page: () => ForgotPasswordScreen(),
        binding: AppBinding()),


    GetPage(name: Routes.stockScreen, page: () => StockScreen()),
    GetPage(name: Routes.addProductForm, page: () => AddProductFromScreen()),
    GetPage(name: Routes.customerHome, page: () => CustomerHome()),
  ];
}

class Routes {
  static const loginScreen = '/loginScreen';
  static const signScreen = '/signScreen';
  static const forgotpasswordScreen = '/forgotpasswordScreen';
  static const profileScreen = '/profileScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const stockScreen = '/StockScreen';
  static const logIn = '/loginScreen';
  static const addProductForm = '/AddProductFromScreen';
  static const editProduct = '/EditProductScreen';
  static const customerHome = '/CustomerHome';
  static const settingsScreen = '/settingsScreen';
}
