import 'package:cloud_firestore/cloud_firestore.dart';

class Product{
  final String name;
  final double price;
  final String market;
  const Product({
    required this.name, required this.price, required this.market
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    Product product = Product(
      name: snap['name'],
      price: snap['price'],
      market: snap['market']
    );
    return product;
  }
  // static const List<Product> products = [
  //   Product(name: 'Rubber', price: 2.99, imageUrl: ""),
  //   Product(name: 'Orange', price: 2.99, imageUrl: ""),
  //   Product(name: 'Pear', price: 2.99, imageUrl: "")
  // ];
}