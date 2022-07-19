import 'package:flutter/material.dart';

import 'CartPage.dart';
import 'IndexPage.dart';
import 'catalog.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    IndexPage(),
    CatalogScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              iconSize: 40,
              showUnselectedLabels: false,
              onTap: (index) => setState(() => currentIndex = index),
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home,color: Colors.blue),
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                    label: 'Cart',
                    icon: Icon(Icons.shopping_cart,color: Colors.blue),
                    backgroundColor: Colors.white
                ),
              ]
          ),
        )
    );
  }

}