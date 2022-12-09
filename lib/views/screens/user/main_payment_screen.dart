import 'package:book_store/utils/theme.dart';
import 'package:book_store/views/widgets/cards_payment_widget.dart';
import 'package:book_store/views/widgets/orderWidget/total_order_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_utils.dart';



class MainPaymentScreen extends StatelessWidget {
  const MainPaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const TextUtils(
          text: 'Payment',
          fontSize: titleLevel1FontSize,
          fontWeight: boldFontWeight,
          color: mainColor,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardsPaymentWidget(),
            TotalOrderWidget()
          ]),
    );

  }
}

