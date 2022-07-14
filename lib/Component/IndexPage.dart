import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:sample_user_listing/themes/color.dart';
import 'package:http/http.dart' as http;
import 'package:mobileapp_p2/Component/RegisterScreen.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List users = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
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
        title: Text("Listing Users"),
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
    //var email = item['email'];
    // var profileUrl = item['picture']['large'];
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen())
            );
          },
          child: ListTile(
            title: Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60/2),
                  ),
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: MediaQuery.of(context).size.width-140,
                        child: Text(fullName,style: TextStyle(color: Colors.black,fontSize: 17),)),
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