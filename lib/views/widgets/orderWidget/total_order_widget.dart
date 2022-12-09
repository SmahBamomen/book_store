import 'package:book_store/logic/controllers/cart_controller.dart';
import 'package:book_store/logic/controllers/payment_controller.dart';
import 'package:book_store/views/widgets/button_apple_pay_widget.dart';
import 'package:book_store/views/widgets/orderWidget/sheet_widget.dart';
import 'package:book_store/views/widgets/paymentStatus/payment_check_wrong.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:book_store/utils/theme.dart';
import 'package:book_store/views/widgets/cards_payment_widget.dart';
import 'package:book_store/views/widgets/orderWidget/total_order_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_utils.dart';

class TotalOrderWidget extends StatelessWidget {
   TotalOrderWidget({Key? key}) : super(key: key);
  final paymentController = Get.put(PaymentController());
   final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      height: 148,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  "Order total",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  controller.total.toString() + " \$",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SheetWidget(),
                const SizedBox(
                    height: 25,
                    child: TextUtils(
                        text:   "Including VAT",
                        fontSize: bodyLevel1FontSize,
                        fontWeight: normalFontWeight,
                        color: hintColor),),
              ],
            ),
          ),

          GetBuilder<PaymentController>(
            builder: (controller) {
              return  controller.payment.toString() == 'Payment.applePay' ? const ButtonApplePay() :
              ElevatedButton(

                onPressed:  controller.payment.toString() == 'Payment.none' ? null :() {

                  Get.to(() => const CheckWrong());

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(118, 118, 118, 1),
                  minimumSize: const Size(255, 40),
                ),
                child:

                TextUtils(
                    text:  controller.payment.toString() == 'Payment.cash' ?"Done":"Pay Now",
                    fontSize: subTitleLevel1FontSize,
                    fontWeight: boldFontWeight,
                    color: Colors.white),

              );

            },
          ),


        ],
      ),
    );
  }
}
