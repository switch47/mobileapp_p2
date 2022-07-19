import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mobileapp_p2/controllers/product_controller.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final productController = Get.put(ProductController());



  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Flexible(
          child: ListView.builder(
              itemCount: productController.products.length,
              itemBuilder: (BuildContext context, int index){
                return ProductCard(index: index);
              }
          ),
        ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final int index;

  const ProductCard({Key? key, required this.index}) : super(key: key);
  CatalogProductCard createState() => CatalogProductCard(index: index);
}

class CatalogProductCard extends State<ProductCard> {
  late FirebaseFirestore _firestore;
  // final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  late int totalPrice;
  final int index;
  CatalogProductCard({Key? key,
    required this.index});


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _firestore = FirebaseFirestore.instance;
  }

  void deleteAllProduct() async {
    final products = await _firestore
        .collection('products')
        .get();
    for (var product in products.docs) {
      _firestore.collection('products').doc(product.id).delete();
    }
  }


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
            onPressed: () async {
              deleteAllProduct();
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


