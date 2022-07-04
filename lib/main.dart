import 'package:flutter/material.dart';
import 'Component/Login_screen.dart';
import 'Component/RegisterScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      home: LoginScreen(),
    );
  }


}
  
