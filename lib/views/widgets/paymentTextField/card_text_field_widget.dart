import 'package:book_store/logic/controllers/checkbox_controller.dart';
import 'package:book_store/logic/controllers/vilidator.dart';
import 'package:book_store/services/textfield_input_formatter.dart';
import 'package:book_store/utils/theme.dart';
import 'package:book_store/views/widgets/paymentTextField/checkbox.dart';
import 'package:book_store/views/widgets/paymentTextField/text_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../text_utils.dart';

class CardTextFieldWidget extends StatefulWidget {
  CardTextFieldWidget({Key? key}) : super(key: key);
  final controller = Get.put(CheckboxController());

  @override
  State<CardTextFieldWidget> createState() => _CardTextFieldWidgetState();
}

class _CardTextFieldWidgetState extends State<CardTextFieldWidget> {
  final formKey = GlobalKey<FormState>();

  Validator validator = Validator();

  final cardNumber = TextEditingController();

  final exDate = TextEditingController();

  final nameOfCard = TextEditingController();

  final cvv = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 361,
      height: 260,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          Form.of(primaryFocus!.context!)?.save();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 15,
                width: 78,
                child:  TextUtils(
                    text:  "Card Number",
                    fontSize: bodyLevel1FontSize,
                    fontWeight:w600FontWeight,
                    color: mainColor),
              ),
              const SizedBox(height: 4),

              SizedBox(
                height: 55,
                width: 329,
                child: TextFormField(
                  style:  textStyleWidget(),
                  keyboardType: TextInputType.number,
                  controller: cardNumber, //
                  decoration: decoration('Enter your card number'),
                  validator: Validator.validateCardNum, //
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardNumberInputFormatter(), //
                  ],
                ),
              ),
              // const SizedBox(height: 17),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                        width: 67,
                        child:
                         TextUtils(
                            text: "Expiry Date ",
                            fontSize: bodyLevel1FontSize,
                             fontWeight:w600FontWeight,
                             color: mainColor),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 214,
                        height: 55, //32 x
                        child: TextFormField(
                          style:  textStyleWidget(),
                          decoration: decoration('MM/YY'),
                          controller: exDate,
                          keyboardType: TextInputType.number,
                          validator: (validateDate) {
                            return Validator.validateDate(validateDate!);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     const SizedBox(
                        height: 15,
                        width: 27,
                        child: TextUtils(
                            text: "CVV ",
                            fontSize: bodyLevel1FontSize,
                            fontWeight:w600FontWeight,
                            color: mainColor),
                      ),
                     const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: 104,
                        height: 55,
                        child: TextFormField(
                          style: textStyleWidget(),
                          controller: cvv,
                          keyboardType: TextInputType.number,
                          validator: (numberValidationMessage) {
                            return Validator.validateCVV(
                                numberValidationMessage!);
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            // Limit the input
                            LengthLimitingTextInputFormatter(3),
                          ],
                          decoration: decoration('123'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const TextUtils(
                  text: "Name on Card  ",
                  fontSize: bodyLevel1FontSize,
                  fontWeight:w600FontWeight,
                  color: mainColor),

              const SizedBox(height: 4),
              SizedBox(
                height: 55,
                width: 329,
                child: TextFormField(
                  style: textStyleWidget(),
                    decoration: decoration('Enter name on Card'),
                    keyboardType: TextInputType.text,
                    controller: nameOfCard,
                    inputFormatters: [],
                    validator: (nameValidationMessage) {
                      return Validator.validateCardName(nameValidationMessage);
                    }),
              ),
              const SizedBox(
                height: 5,
              ),
              ChecWidget(),
              const  SizedBox(
                height: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
  TextStyle textStyleWidget(){
    return const TextStyle(
      fontSize:subTitleLevel2FontSize,
      fontWeight: normalFontWeight,
      color: mainColor,
    );
  }

}

