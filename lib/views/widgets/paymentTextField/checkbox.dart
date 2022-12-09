import 'package:book_store/logic/controllers/checkbox_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:book_store/utils/theme.dart';

import '../text_utils.dart';


class ChecWidget extends StatelessWidget {
  ChecWidget({Key? key}) : super(key: key);

  final controller = Get.find<CheckboxController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckboxController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: controller.isCheckBox
                  ? const Icon(
                      Icons.done,
                      color: Colors.green,
                      size: 16,
                    )
                  : const Icon(
                      Icons.done,
                      color: Colors.white24,
                      size: 16,
                    ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const TextUtils(
              text: 'Save this card for future payments ',
              fontSize: subTitleLevel2FontSize,
              fontWeight:w500FontWeight,
              color: mainColor),
        ],
      );
    });
  }
}
