import 'dart:io';
import 'package:bai_cuoi_ky/Widget/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          // lay trong file json dc tai
          apiKey: 'AIzaSyDP0JQQ_j8ACpd3I7YLrU-MmDUNsBMD-5U', // current_key
          appId:
              "1:994252590551:android:a2ec1cd89eb64379638f92", //mobilesdk_app_id
          messagingSenderId: "994252590551", // project_number
          projectId: "app-thoi-tiet-f2145",
          storageBucket:"app-thoi-tiet-f2145.appspot.com"  // project_id
        ))
      : await Firebase.initializeApp();
  runApp(MyApp());
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
