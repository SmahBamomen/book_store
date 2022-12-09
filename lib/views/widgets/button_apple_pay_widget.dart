import 'package:book_store/views/widgets/paymentStatus/payment_check_successful.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonApplePay extends StatelessWidget {
  const ButtonApplePay({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 343,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Get.to(() => const CheckSuccessful());
        },
        style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll<Color>(Colors.black),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        child: const Text(
          "Pay",
          style: TextStyle(fontSize: 23),
        ),
      ),
    );
  }
}
