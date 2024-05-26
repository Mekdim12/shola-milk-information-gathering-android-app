import 'package:flutter/material.dart';
import '../components/navigation_drawer.dart' as drawer;

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        drawer: drawer.NavigationDrawer(),
        appBar: AppBar(
          title: const Text(
            'Home Page',
            style: TextStyle(
                color: Color(0xFFECDECB), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF1D6EA0),
          iconTheme: const IconThemeData(
              color: Color(0xFFECDECB)), // change this to your desired color
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 237, 233, 224),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.35,

                    // have border radius in the boottom
                    decoration: const BoxDecoration(
                      //  color: const Color(0xFF1D6EA0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF1D6EA0),
                          Color.fromARGB(255, 107, 166, 202),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(26),
                        bottomRight: Radius.circular(26),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: (width - 40) / 2,
                            height: height * 0.18, // Reduced height
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/small_background.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text("data"),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            width: (width - 40) / 2,
                            height: height * 0.18, // Reduced height
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/background_small.png'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
