import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final String name;
  final double price;
  final String imageUrl;
  const Product({
    required this.name, required this.price, required this.imageUrl
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      price: snap['price'],
      imageUrl: snap['imageUrl']
    );
    return product;
  }
  // static const List<Product> products = [
  //   Product(name: 'Rubber', price: 2.99, imageUrl: ""),
  //   Product(name: 'Orange', price: 2.99, imageUrl: ""),
  //   Product(name: 'Pear', price: 2.99, imageUrl: "")
  // ];
}