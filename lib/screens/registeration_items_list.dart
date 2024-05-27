import 'dart:io';

import 'package:flutter/material.dart';
import '../models/data.dart';

class StockInformationPurchasedList extends StatefulWidget {
  const StockInformationPurchasedList({Key? key}) : super(key: key);

  @override
  State<StockInformationPurchasedList> createState() =>
      _StockInformationPurchasedListState();
}

class _StockInformationPurchasedListState
    extends State<StockInformationPurchasedList> {
  late Future<List<PurchasedItems>> itemsFuture;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    itemsFuture = PurchasedItems.readData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D6EA0),
        iconTheme: const IconThemeData(
            color: Color(0xFFECDECB)), // change this to your desired color
       
      ),
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.07,
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
            child: const Center(
              child: Text(
                'የተመዘገቡ እቃዎች ዝርዝር',
                style: TextStyle(
                    fontSize: 21,
                    color: Color(0xFFECDECB),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FutureBuilder<List<PurchasedItems>>(
            future: itemsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('An error occurred!'));
              } else {
                final items = snapshot.data!;
                return Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(
                            label: Container(
                                color: Colors.red, child: Text('Item Name'))),
                        DataColumn(
                            label: Container(
                                color: const Color.fromARGB(172, 76, 175, 79), child: Text('Item Count'))),
                        DataColumn(
                            label: Container(
                                color: const Color.fromARGB(184, 33, 149, 243), child: Text('Payed Price'))),
                        DataColumn(
                            label: Container(
                                color: const Color.fromARGB(203, 255, 235, 59),
                                child: Text('Date and Time of Arrival'))),
                        DataColumn(
                            label: Container(
                                color: const Color.fromARGB(212, 155, 39, 176),
                                child: Text('Receipt Image'))),
                      ],
                      rows: items
                          .map((item) => DataRow(cells: [
                                DataCell(Text(item.itemName)),
                                DataCell(Text('${item.itemCount}')),
                                DataCell(Text(item.payedPrice.toString())),
                                DataCell(Text(item.dateAndTimeOfArrival)),
                                DataCell(Image.file(File( item.recipetImage))),
                              ]))
                          .toList(),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}