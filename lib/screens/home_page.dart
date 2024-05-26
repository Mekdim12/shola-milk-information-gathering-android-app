import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      body: Center(
        child:  Text('Home Page'),
      )
    );
  }
}