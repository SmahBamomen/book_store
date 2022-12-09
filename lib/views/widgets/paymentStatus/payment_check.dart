import 'package:book_store/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../text_utils.dart';

class PaymentCheck extends StatelessWidget {
  final String statusImage;
  final String text;
  final String description;
  const PaymentCheck(
      {super.key,
      required this.statusImage,
      required this.text,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/images/$statusImage', fit: BoxFit.cover)),
          const SizedBox(
            height: 15,
          ),
          TextUtils(
              text: text,
              fontSize: 25,
              fontWeight: boldFontWeight,
              color: mainColor),
          Container(
              padding: EdgeInsets.only(left: 25, right: 20, top: 10),
              width: 250,
              child: TextUtils(
                  text: description,
                  fontSize: titleLevel1FontSize,
                  fontWeight: normalFontWeight,
                  color: mainColor))
        ],
      ),
    );
  }
}
