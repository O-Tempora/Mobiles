import 'package:app/pages/authentication.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';

void main() {
  runApp(const MyApp());
  DesktopWindow.setWindowSize(Size(393, 853));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Manager App',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(14, 70, 73, 1.0),
      ),
      home: const AuthenticationPage(),
    );
  }
}
