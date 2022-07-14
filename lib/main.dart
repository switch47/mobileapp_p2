import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Component/IndexPage.dart';
import 'Component/Login_screen.dart';
import 'Component/RegisterScreen.dart';
import 'Component/user_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {

  // late List<UserModel>? _userModel = [];
  //
  // @override
  // void initState() {
  //
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      home: LoginScreen(),
    );
  }
}
  
