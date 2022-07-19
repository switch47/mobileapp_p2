import 'package:get/get.dart';

import '../models/product_model.dart';
import '../service/firestore_db.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}