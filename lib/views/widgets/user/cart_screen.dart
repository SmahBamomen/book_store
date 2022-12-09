import 'package:book_store/logic/controllers/cart_controller.dart';
import 'package:book_store/model/product.dart';
import 'package:book_store/routes.dart';
import 'package:book_store/utils/text_utils.dart';
import 'package:book_store/views/screens/user/main_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Cart Items',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
       actionsIconTheme: IconThemeData.fallback(),

       backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(
                Icons.backspace,
                color: Colors.black,
              ))
        ],
      ),
      body: Obx(() {
        if (controller.productMap.isEmpty) {
          return const EmptyCart();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                SizedBox(
                  height: 590,

                  child: ListView.separated(
                    padding: EdgeInsets.only(left: 16,right: 16),
                      itemBuilder: (context, index) {
                        return CartProductCard(
                            quantity:
                                controller.productMap.values.toList()[index],
                            index: index,
                            productModels:
                                controller.productMap.keys.toList()[index]);
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                      itemCount: controller.productMap.length),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 30), child: CartTotal()),
              ],
            ),
          );
        }
      }),
    );
  }
}

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                    text: "Total",
                    fontsize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    underLine: TextDecoration.none),
                Text(
                  "\$${controller.total}",
                  style: TextStyle(
                      color:  Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Get.to(() => const MainPaymentScreen());

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Check Out",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.shopping_cart)
                      ],
                    )),
              ),
            )
          ],
        ),
      );
    });
  }
}

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {Key? key,
      required this.productModels,
      required this.index,
      required this.quantity})
      : super(key: key);
  final Product productModels;
  final int index;
  final int quantity;
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 5),
        height: 130,
        width: 100,

        decoration: BoxDecoration(

          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              width: 100,
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productModels.imageUrl))),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModels.productName,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "\$${controller.productSubTotal[index]}",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          controller.removeProductsFarmCart(productModels);
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        )),
                    Text(
                      "$quantity",
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.addProductToCrt(productModels);
                        },
                        icon: Icon(
                          Icons.add_circle,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        )),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      controller.removeOneProduct(productModels);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 20,
                      color: Get.isDarkMode ? Colors.black : Colors.red,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(height: 40),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "Your Cart is",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
            TextSpan(
                text: " Empty",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ])),
          const SizedBox(height: 10),
          Text("Add items to get started",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
          SizedBox(height: 50),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                    primary: Colors.black),
                onPressed: () {
                  Get.toNamed(Routes.customerHome);
                },
                child: const Text(
                  "Go to Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
