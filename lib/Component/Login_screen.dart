import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobileapp_p2/Component/todo.dart';

import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';

  @override
  void initState() {
    super.initState();
    initFirebase();
  }

  void initFirebase() async {
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          const SizedBox(height: 30),
          TextField(
            onChanged: (value) {
              email = value;
            },
            decoration: const InputDecoration(
              hintText: 'email',
            ),
          ),
          TextField(
            onChanged: (value) {
              password = value;
            },
            decoration: const InputDecoration(
              hintText: 'password',
            )
          ),
          TextButton(
            child: const Text('Login'),
            onPressed: () async {
              try {
                final user = await _auth.signInWithEmailAndPassword(
                    email: email, password: password);
                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Todo()),
                  );
                }
                else {
                  print("Login failed");
                }
              }
              catch(e) {
                print(e);
              }
            }
          ),
          TextButton(
            child: const Text('Register'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterScreen()),
              );
            }
          )
        ]
      )
    );
  }
}