import 'package:flutter/material.dart';
import 'package:souq_application_1/Root.dart';
import 'package:souq_application_1/details/ditels.dart';
import 'package:souq_application_1/screens/Bacet.dart';
// ignore: unused_import
import 'package:souq_application_1/screens/Home.dart';
import 'package:souq_application_1/screens/splah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        builder: (context, child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child!,
    );
  },
      home:SplashScreen()
    );
  }
}

