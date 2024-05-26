import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import  'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shola Milk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenWidget(),
    );
  }
}