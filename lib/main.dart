import 'package:flutter/material.dart';
import 'pages/login_signup.dart';
import 'pages/homePage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toll',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginSignUpPage(),
    );
  }
}


