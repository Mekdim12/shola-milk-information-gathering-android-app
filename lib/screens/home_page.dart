import 'package:flutter/material.dart';

class HomePageWidget extends StatefulWidget {
    const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text('Text 1'),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text('Text 2'),
            ),
          ),
          Container(
            color: Colors.red,
            child: const Center(
              child: Text('Text 3'),
            ),
          ),
          Container(
            color: Colors.yellow,
            child: const Center(
              child: Text('Text 4'),
            ),
          ),
        ],
      ),
    );
  }
}