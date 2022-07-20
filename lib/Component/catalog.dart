import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CartPage.dart';
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), backgroundColor: Colors.green,),
      backgroundColor: Color(0xFFCCFF90),
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
