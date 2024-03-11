import 'package:bai_cuoi_ky/Widget/homeScreen.dart';
import 'package:bai_cuoi_ky/Widget/loginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "app thời tiết",
      initialRoute: "/",
      routes: {
        '/' : (context) => LoginScreen()
      },

    );
  }
}
