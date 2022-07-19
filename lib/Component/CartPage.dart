import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp_p2/controllers/product_controller.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';
class CartPage extends StatelessWidget {
  final productController = Get.put(ProductController());
  CartPage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Flexible(
          child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index){
                return CatalogProductCard(index: index);
              }
          ),
        ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  late FirebaseFirestore _firestore;
  // final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;
  CatalogProductCard({Key? key,
    required this.index}) : super(key: key);

  @override
  void initState() {
    // TODO: implement initState
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _firestore = FirebaseFirestore.instance;
  }

  // Future deleteData(String id) async {
  //   try {
  //     await _firestore.collection("products")
  //         .doc(id)
  //         .delete();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,
          vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // CircleAvatar(
          //   radius: 40,
          //   backgroundImage: NetworkImage(
          //     productController.products[index].imageUrl,
          //   ),
          // ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              productController.products[index].name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
          Expanded(
            child: Text('${productController.products[index].price}'),
          ),
          // Expanded(
          //   child: Text('${productController.products[index].price}'),
          // ),
          IconButton(
            onPressed: (){
              _firestore.collection("products")
                  .doc(index.toString()).delete();
            },
            icon: Icon(
              Icons.delete,
            ),
          ),
        ],
      ),
    );
  }
}


