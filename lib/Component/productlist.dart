import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'api_service.dart';
import 'user_model.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<UserModel>? _userModel;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = await ApiService().getUsers();
    if (_userModel != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product list'),
        ),
        body: Visibility(
          visible: isLoaded,
          child: ListView.builder(
              itemCount: _userModel?.length,
              itemBuilder: (context, i) {
                return Container(
                  // title: Text(_userModel![i].prProdName),
                  child: Text('Hi'),
                );
              }
          ),
          // replacement: const Center(child: CircularProgressIndicator()),
        )
      )
    );
  }
}