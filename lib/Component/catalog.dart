import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp_p2/widgets/cart_total.dart';
import '../widgets/cart_screen.dart';
import '../widgets/catalog_products.dart';
import 'CartPage.dart';
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: SafeArea(
        child: Column(
          children: [
            CartPage(),
            // ElevatedButton(onPressed: ()=> Get.to(()=>const CartScreen())
            //     , child: Text('Go to Cart'))
          ],
        ),
      ),
    );
  }
}
