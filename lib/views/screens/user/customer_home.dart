import 'package:book_store/logic/controllers/prodect_controller.dart';
import 'package:book_store/model/product.dart';
import 'package:book_store/views/screens/setting/profile_screen.dart';
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

                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: Icon(Icons.search),
                  onPressed: () {
                    controller.pages(1);

                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(left: 28.0),
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    controller.pages(2);

                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  padding: EdgeInsets.only(right: 28.0),
                  icon: Icon(Icons.person),
                  onPressed: () {
                    controller.pages(3);

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
            ProfileScreen()

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


  }
}
