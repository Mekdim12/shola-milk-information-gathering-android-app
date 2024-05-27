import 'package:flutter/material.dart';
import '../components/navigation_drawer.dart' as drawer;
import 'stock_information_filling_page.dart';
import 'package:get/get.dart';
import 'registeration_items_list.dart';
import 'package:flutter/services.dart';
import '../models/data.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageWidget> {
  late Future<List<PurchasedItems>> itemsFuture;
  int tottalRecordedItem = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      tottalRecordedItem = 0; 
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //  read the data from the json file and check the length of the data and display it
    itemsFuture = PurchasedItems.readData();
    itemsFuture.then((value) {
      tottalRecordedItem = value.length;
      setState(() {
        tottalRecordedItem = value.length;
      });
    });
   

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
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "የተመዘገቡ እቃዎች ብዛት",
                                    style: TextStyle(
                                        color: Color(0xFF1D6EA0),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "$tottalRecordedItem",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
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
                            child: const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "ያሉን ምርቶች ብዛት",
                                    style: TextStyle(
                                        color: Color(0xFF1D6EA0),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "5",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 35,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      StockInformationCollector()),
                            );
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
                            Get.to(
                              const StockInformationPurchasedList(),
                              transition: Transition.circularReveal,
                              duration: const Duration(milliseconds: 1000),
                            );
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
                                          "ዝርዝር",
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
                            // exit the app

                            SystemNavigator.pop();
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
