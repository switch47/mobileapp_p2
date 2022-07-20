import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:sample_user_listing/themes/color.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp_p2/Component/RegisterScreen.dart';

class IndexPage extends StatefulWidget {
  late final String email;
  late final String password;

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;
  late String loggedInUser;

  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    _firestore = FirebaseFirestore.instance;

    // await _auth.signInWithEmailAndPassword(
    //   email: "kongkiatacp@hotmail.com", password: "bank47630"
    // );
    await _auth.signInWithEmailAndPassword(email: widget.email, password: widget.password);

    loggedInUser = _auth.currentUser?.email ?? 'none';
    print(loggedInUser);
  }

  fetchUser() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse("https://opend.data.go.th/get-ckan/datastore_search?resource_id=3958110b-ed7c-4dd7-aaf5-5b89f6f2a2d7");
    var response = await http.get(url, headers: {'api-key': 'd6svb7BUMzADvhMRcsZcKtC1ROoH4zKV'});
    // print(response.body);
    if(response.statusCode == 200){
      var items = json.decode(response.body)["result"]["records"];
      setState(() {
        users = items;
        isLoading = false;
      });
    }else{
      users = [];
      isLoading = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
        backgroundColor: Colors.green,
      ),
      body: getBody(),
    );
  }
  Widget getBody(){
    if(users.contains(null) || users.length < 0 || isLoading){
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),));
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context,index){
          return getCard(users[index]);
        });
  }

  Widget getCard(item){
    var fullName = item["PR_PROD_NAME"];
    var price = item["PRICE_DAY"];
    var market = item["MARKET_NAME"];
    num totalPrice = 0;
    //var email = item['email'];
    // var profileUrl = item['picture']['large'];
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      color: Color(0xFFCCFF90),
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          // onTap: () {
          //   // Navigator.push(
          //   //   context,
          //   //   MaterialPageRoute(builder: (context) => RegisterScreen())
          //   // );
          //   Map<String, dynamic> data = {
          //     'name': fullName,
          //     'price': price,
          //     'market': market
          //   };
          //   _firestore.collection('products').add(data);
          // },
          child: ListTile(
            leading: Icon(
              Icons.food_bank_outlined,
              color: Color(0xFF40ADF0),
              size: 40,
            ),
            title: Row(
              children: <Widget>[
                // Container(
                //   width: 60,
                //   height: 60,
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(60/2),
                //   ),
                // ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width-140,
                        child: Column(
                          children: [
                            Text(fullName + "  ${price} Baht",style: TextStyle(color: Colors.black,fontSize: 17)),
                            IconButton(onPressed: () {
                              // totalPrice = totalPrice + price;
                              Map<String, dynamic> data = {
                                'name': fullName,
                                'price': price,
                                'market': market,
                                // 'totalPrice': totalPrice,
                              };
                              // _firestore.collection("users").doc(loggedInUser).collection('products').add(data);
                              _firestore.collection('products').add(data);
                              // Map<String, dynamic> data2 = {
                              //   'totalPrice': totalPrice,
                              // };
                              // _firestore.collection('totalPrice').add(data2);
                            },
                                icon: Icon(Icons.add_circle, color: Colors.blue),
                            )
                          ],
                        )
                        // child: Text(fullName,style: TextStyle(color: Colors.black,fontSize: 17),)
                    ),
                    SizedBox(height: 10,),
                    // Text(email.toString(),style: TextStyle(color: Colors.grey),)
                  ],
                ),
              ],
            ),
          ),
        )

      ),
    );
  }
}