
import 'package:book_store/model/product.dart';
import 'package:book_store/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCrt(Product productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;

    } else {
      productMap[productModels] = 1;
    }
  }

  void removeProductsFarmCart(Product productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }

  }

  void removeOneProduct(Product productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      middleText: 'Are you sure you need clear products ',
      middleTextStyle: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No",
      cancelTextColor: Colors.black,
      textConfirm: " Yes",
      confirmTextColor: Colors.black,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },

    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}