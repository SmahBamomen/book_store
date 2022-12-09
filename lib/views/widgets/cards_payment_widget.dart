import 'package:book_store/logic/controllers/payment_controller.dart';
import 'package:book_store/model/payment_model.dart';
import 'package:book_store/utils/theme.dart';
import 'package:book_store/views/widgets/paymentTextField/card_text_field_widget.dart';
import 'package:book_store/views/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

class CardsPaymentWidget extends StatelessWidget {
  CardsPaymentWidget({Key? key}) : super(key: key);
  final controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: GetBuilder<PaymentController>(
        builder: (controller) => Container(
          padding: const EdgeInsets.only(top: 21),
          height: 560,
          child: ListView(
            children: <Widget>[
              paymentCard(
                  controller: controller,
                  title: 'Credit/Debit Card',
                  subTitle: 'Pay using cards',
                  value: Payment.creditCard,
                  color: controller.selectedItem ? Colors.grey : Colors.white,
                  image: SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        imageWidget('assets/images/mada.svg'),
                        const SizedBox(
                          width: 8,
                        ),
                        imageWidget('assets/images/visa.svg'),
                        const SizedBox(
                          width: 8,
                        ),
                        imageWidget('assets/images/master.svg')
                      ],
                    ),
                  )),
              controller.payment == Payment.creditCard
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 4, right: 4),
                      child: CardTextFieldWidget(),
                    )
                  : Container(),
              paymentCard(
                  controller: controller,
                  title: 'Apple Pay',
                  subTitle: '',
                  value: Payment.applePay,
                  color: controller.selectedItem ? Colors.grey : Colors.white,
                  image: imageWidget('assets/images/apple.svg')),
              paymentCard(
                  controller: controller,
                  title: 'Cash On Delivery',
                  subTitle: 'Processing fee applicable',
                  value: Payment.cash,
                  color: controller.selectedItem ? Colors.grey : Colors.white,
                  image: imageWidget('assets/images/cash.svg')),
            ],
          ),
        ),
      ),
    );
  }
}

// Payment Card widget
Widget paymentCard({
  required String title,
  required String subTitle,
  required Payment value,
  required Widget image,
  required Color color,
  required PaymentController controller,
}) {
  return Card(
    color: controller.payment == value
        ? const Color.fromRGBO(239, 239, 239, 1)
        : Colors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      side: BorderSide(
        color: Color.fromRGBO(208, 208, 208, 1),
      ),
      borderRadius:  BorderRadius.all(Radius.circular(4)),
    ),
    child: Padding(
      padding:
          subTitle != '' ? const EdgeInsets.only(top: 0) : const EdgeInsets.only(top: 8),
      child: SizedBox(
        height: subTitle != '' ? 70 : 62,
        child: ListTile(
          leading: Transform(
            transform: Matrix4.translationValues(-10, 0.0, 0.0),
            child: Radio<Payment>(
              activeColor: Colors.black,
              value: value,
              autofocus: true,
              groupValue: controller.payment,
              onChanged: (Payment? value) {
                controller.selectPayment(value);
              },
            ),
          ),
          horizontalTitleGap: 0,
          title: Transform(
            transform: Matrix4.translationValues(-12, 0.0, 0.0),
            child: TextUtils(
              text: title,
              fontSize: titleLevel2FontSize,
              fontWeight: w500FontWeight,
              color: mainColor,
            ),
          ),
          subtitle: subTitle != ''
              ? Transform(
                  transform: Matrix4.translationValues(-12, 0.0, 0.0),
                  child: TextUtils(
                    text: subTitle,
                    fontSize: subTitleLevel2FontSize,
                    fontWeight: normalFontWeight,
                    color: hintColor,
                  ))
              : null,
          trailing: image,
        ),
      ),
    ),
  );
}

Widget imageWidget(String image) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: const [
          BoxShadow(blurRadius: 2, color: Color.fromRGBO(0, 0, 0, 0.25)),
        ],
      ),
      child: SvgPicture.asset(image, width: 37, height: 24, fit: BoxFit.cover));
}
