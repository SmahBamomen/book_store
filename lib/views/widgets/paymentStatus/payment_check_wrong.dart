import 'package:book_store/views/widgets/paymentStatus/payment_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckWrong extends StatelessWidget {
  const CheckWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaymentCheck(
        statusImage: 'wrong.svg',
        text: 'Oops!',
        description:
            'Something went wrong. Please try again or choose another payment.');
  }
}
