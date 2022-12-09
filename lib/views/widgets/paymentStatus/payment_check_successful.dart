import 'package:book_store/views/widgets/paymentStatus/payment_check.dart';
import 'package:flutter/material.dart';

class CheckSuccessful extends StatelessWidget {
  const CheckSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentCheck(
        statusImage: 'successful.svg',
        text: 'Thank You!',
        description: 'Your payment was successful.');
  }
}
