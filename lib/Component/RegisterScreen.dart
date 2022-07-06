import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Login_screen.dart';

class RegisterScreen extends StatefulWidget {

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late FirebaseAuth _auth;
  String email = '';
  String password = '';
  String confirm_password = '';

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
            children: [
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
                ),
              ),
              TextField(
                onChanged: (value) {
                  confirm_password = value;
                },
                decoration: const InputDecoration(
                  hintText: 'confirm_password',
                ),
              ),
              TextButton(
                child: const Text('<- login'),
                onPressed: () async {
                  Navigator.pop(context);
                }
              ),
              TextButton(
                  child: const Text('create account'),
                  onPressed: () async {
                    try {
                      if (password == confirm_password) {
                        final newUser = await _auth
                            .createUserWithEmailAndPassword(
                            email: email, password: password
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      }
                      else {
                        AlertDialog(
                          title: const Text('Password is incorrect.'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: const <Widget>[
                                Text('Password is incorrect!'),
                              ],
                            )
                          )
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
              )
            ]
        )
    );
  }
}