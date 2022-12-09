import 'package:book_store/logic/controllers/prodect_controller.dart';
import 'package:book_store/views/widgets/user/cart_item_customer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProdectController());

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<ProdectController>(builder: (_) {
      return Column(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.productList;

                if (controller.productList.isNotEmpty) {
                  return CardItem(prodects: controller.productList);
                } else {
                  return Text("No thing");
                }
              } else {
                return CardItem(prodects: controller.productList);
              }
            },
          ),
        ],
      );
    }
    );
  }
}
