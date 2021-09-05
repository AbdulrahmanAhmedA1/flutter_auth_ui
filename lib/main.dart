import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/screens/login.dart';
import 'package:flutter_auth_ui/screens/register.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
      routes: {
        Register.route: (context) => Register(),
        Login.route: (context) => Login(),
      },
    );
  }
}
