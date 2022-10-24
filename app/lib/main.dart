import 'package:app/pages/authentication.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Manager App',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(14, 70, 73, 1.0),
      ),
      home: const AuthenticationPage(),
    );
  }
}
