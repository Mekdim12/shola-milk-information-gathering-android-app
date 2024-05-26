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
        drawer: const drawer.NavigationDrawer(),
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
                            child: const Text("data"),
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
                  const SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("<");
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26)),
                            ),
                            height: height * 0.1,
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: (width * 0.60),
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Icon(
                                          Icons.app_registration_rounded,
                                          color: Color(0xFF124521),
                                        ),
                                      ),
                                      Text(
                                        "የገቡ እቃውች መመዝገብ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color(0xFF1D6EA0)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    // width: 100,
                                    width: width * 0.17,
                                    height: 50,
                                    child: Image.asset(
                                        'assets/images/yoghurt_prodcuts_icon.png'))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("<");
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26)),
                            ),
                            height: height * 0.1,
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: (width * 0.60),
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Icon(
                                          Icons.store,
                                          color: Color(0xFF124521),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "ዘርዝር",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Color(0xFF1D6EA0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: width * 0.17,
                                    height: 50,
                                    child: Image.asset(
                                        'assets/images/milk_icon.png'))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("<");
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26)),
                            ),
                            height: height * 0.1,
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: (width * 0.60),
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Icon(
                                          Icons.campaign_rounded,
                                          color: Color(0xFF124521),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "ሰለ ሾላ ምርቶች",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Color(0xFF1D6EA0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: width * 0.17,
                                    height: 50,
                                    child: Image.asset(
                                        'assets/images/highland_milk_icon.png'))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("<");
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(26)),
                            ),
                            height: height * 0.1,
                            margin:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: (width * 0.60),
                                  child: const Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Icon(
                                          Icons.exit_to_app_rounded,
                                          color: Color(0xFF124521),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "መውጫ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Color(0xFF1D6EA0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    width: width * 0.17,
                                    height: 100,
                                    child: Image.asset(
                                        'assets/images/shola_cow_icon.png'))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
