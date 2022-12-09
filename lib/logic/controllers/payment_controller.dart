
import 'package:book_store/model/payment_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';



class PaymentController extends GetxController {
  Payment? payment = Payment.none;
  bool selectedItem = false;

  void selectPayment(value) {
    payment = value;
    selectedItem = !selectedItem;
    update();
  }
}

