import 'package:book_store/logic/controllers/cart_controller.dart';
import 'package:book_store/logic/controllers/prodect_controller.dart';
import 'package:book_store/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:book_store/utils/theme.dart';


import '../../widgets/text_utils.dart';


class SheetWidget extends StatelessWidget {
  SheetWidget({super.key, });
  final controller = Get.find<CartController>();
  final prodectController = Get.put(ProdectController());


  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      height: 25,
      child: TextButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                height: 400,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(left: 15, top: 30),
                            child:
                            const TextUtils(
                              text: 'Order Summary:',
                              fontSize: titleLevel2FontSize,
                              fontWeight: boldFontWeight,
                              color: mainColor,
                            ),),

                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          // ignore: prefer_const_constructors
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: const Color.fromRGBO(149, 149, 149, 1),
                            size: 20,
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.productMap.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            padding: const EdgeInsets.only(left: 16,right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 TextUtils(
                                  text:controller.productMap.keys.toList()[index].productName,
                                  fontSize: titleLevel2FontSize,
                                  fontWeight: w500FontWeight,
                                  color: mainColor,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Column(
                                    children: [
                                      TextUtils(
                                        text:    "${controller.productMap.keys.toList()[index].price} SAR",
                                        fontSize: subTitleLevel1FontSize,
                                        fontWeight: w500FontWeight,
                                        color: mainColor,
                                      ),

                                      const SizedBox(
                                        height: 8,
                                      ),

                                        TextUtils(
                                        text: "Quantity :${controller.productMap.keys.toList()[index].quantity}",
                                        fontSize: titleLevel2FontSize,
                                        fontWeight: normalFontWeight,
                                        color: mainColor,
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                          indent: 15,
                          endIndent: 15,
                          color: dividerColor,
                        ),
                      ),
                    ),
                    const Divider(
                      indent: 15,
                      endIndent: 15,
                      color: dividerColor,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [

                              TextUtils(
                                  text: "Order ID:",
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight: normalFontWeight,
                                  color: hintColor),
                              TextUtils(
                                  text:     "# 000004",
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight: boldFontWeight,
                                  color: mainColor),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              TextUtils(
                                  text:    "Order Date:",
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight: normalFontWeight,
                                  color: hintColor),

                              TextUtils(
                                  text:   "18-05-2022",
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight: normalFontWeight,
                                  color: mainColor),

                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                             const TextUtils(
                                  text:     "Delivery:",
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight: normalFontWeight,
                                  color: hintColor),


                              TextUtils(
                                  text: '18',
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight: normalFontWeight,
                                  color: mainColor),

                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [

                              const TextUtils(
                                  text:   "Total Amount: ",
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight: normalFontWeight,
                                  color: hintColor),

                              TextUtils(
                                  text:  "${controller.total + 18.00.toString()}",
                                  fontSize: subTitleLevel2FontSize,
                                  fontWeight:boldFontWeight,
                                  color: mainColor),

                            ],
                          ),
                          const SizedBox(
                            height: 26,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          style: TextButton.styleFrom(
              padding: const EdgeInsets.only(bottom: 13),
              foregroundColor:
              const Color.fromRGBO(118, 118, 118, 1)),
          child: Row(children: const [

            TextUtils(
                text: "show order summary",
                fontSize: bodyLevel1FontSize,
                fontWeight:normalFontWeight,
                color: hintColor),

            Icon(
              Icons.keyboard_arrow_down,
              size: 15,
            ),
          ])),
    );
  }
}