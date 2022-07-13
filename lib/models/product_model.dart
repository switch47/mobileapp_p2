class Product{
  final String name;
  final double price;
  final String imageUrl;
  const Product({
    required this.name, required this.price, required this.imageUrl
  });
  static const List<Product> products = [
    Product(name: 'Rubber', price: 2.99, imageUrl: ""),
    Product(name: 'Orange', price: 2.99, imageUrl: ""),
    Product(name: 'Pear', price: 2.99, imageUrl: "")
  ];
}