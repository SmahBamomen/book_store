import 'package:book_store/logic/controllers/prodect_controller.dart';
import 'package:book_store/model/product.dart';
import 'package:book_store/views/widgets/user/cart_screen.dart';
import 'package:book_store/views/widgets/user/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/text_utils.dart';
import '../../widgets/SearchProducts.dart';
import '../../widgets/user/cart_item_customer.dart';
import '../../widgets/user/favourites/prodects_favourites.dart';

class CustomerHome extends StatelessWidget {
  CustomerHome({Key? key}) : super(key: key);
  final controller = Get.put(ProdectController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdectController>(builder: (_){
      return  Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: TextUtils(
            text: 'Book Store',
            color:Colors.black,
            fontWeight:FontWeight.bold,
              fontsize:22,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 75,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.home),
                  onPressed: () {
                    controller.pages(0);
                    // setState(() {
                    //   _myPage.jumpToPage(0);
                    // });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    controller.pages(1);
                    // setState(() {
                    //   _myPage.jumpToPage(1);
                    // });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    controller.pages(2);
                    // setState(() {
                    //   _myPage.jumpToPage(2);
                    // });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: Icon(Icons.person),
                  onPressed: () {
                    controller.pages(3);
                    // setState(() {
                    //   _myPage.jumpToPage(3);
                    // });
                  },
                )
              ],
            ),
          ),
        ),
        body: PageView(
          controller: controller.myPage,
          onPageChanged: (int) {
            print('Page Changes to index $int');
          },
          children: <Widget> [
            HomeScreen(),
            Container(
              margin: EdgeInsets.only(top: 100),
                child: SearchProducts()),
            prodectsFavourites(),
            Center(
              child: Container(
                child: Text('Empty Body 3'),
              ),
            ),

          ],
          physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
        ),
        floatingActionButton: Container(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(
              onPressed: () {
                Get.to(() =>  CartScreen());
              },
              child: Icon(
                Icons.shopping_basket_outlined,
                color: Colors.white,
              ),
              // elevation: 5.0,
            ),
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 145,
        iconTheme: IconThemeData(color: Colors.black),
        title: Container(
            //margin: EdgeInsets.only(top: 20),
            child: SearchProducts()),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print(controller.favouritesList);
              Get.to(prodectsFavourites());
            },
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.prodects = snapshot.data!.docs
                    .map((e) => Product(
                        productNumber: e['productNumber'],
                        productName: e['productName'],
                        category: e['category'],
                        quantity: e['quantity'],
                        price: e['price'],
                        description: e['description'],
                        imageUrl: e['imageUrl']))
                    .toList();

                print('leeength ${controller.prodects.length}');
                if (controller.prodects.isNotEmpty) {
                  return CardItem(prodects: controller.prodects);
                } else {
                  return Text("No thing");
                }
              } else {
                return CardItem(prodects: controller.prodects);
              }
            },
          ),
        ],
      ),
    );
  }
}
