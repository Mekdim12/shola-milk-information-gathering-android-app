import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../models/data.dart';

class StockInformationCollector extends StatefulWidget {
  const StockInformationCollector({super.key});

  @override
  State<StockInformationCollector> createState() =>
      _StockInformationCollectorState();
}

class _StockInformationCollectorState extends State<StockInformationCollector> {
  final itemName = TextEditingController();
  bool isItemNameInvalid = true;

  final itemNumber = TextEditingController();
  bool isItemNumberInvalid = true;

  final tottalPaymentItem = TextEditingController();
  bool tottalPaymentItemvalid = true;

  final itemArrivalTimeAndDate = TextEditingController();
  bool itemAarrivalTimeAndDateIsValid = true;

  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D6EA0),
        iconTheme: const IconThemeData(
            color: Color(0xFFECDECB)), // change this to your desired color
        actions: const [
          Icon(
            Icons.bookmark_add_rounded,
            color: Color(0xFFECDECB),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
           height: height,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 237, 233, 224),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: width,
                    height: height * 0.15,
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
                        'የተገዙ አቃዎች መመዝገቢያ',
                        style: TextStyle(
                            fontSize: 21,
                            color: Color(0xFFECDECB),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: height * 0.60,
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 35, top: 50),
                          child: TextField(
                              controller: itemName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: (isItemNameInvalid)
                                              ? Color(0xFF1D6EA0)
                                              : Colors.red)),
                                  icon: const Icon(Icons.abc_rounded),
                                  iconColor: (isItemNameInvalid)
                                      ? Color(0xFF1D6EA0)
                                      : Colors.red,
                                  labelText: " የእቃዉ ስም",
                                  labelStyle: const TextStyle(
                                    color: Color(0xFF1D6EA0),
                                  ),
                                  hoverColor: Colors.amberAccent),
                              cursorColor: Colors.black),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 35, top: 50),
                          child: TextField(
                              keyboardType: TextInputType.number,
                              controller: itemNumber,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: (isItemNumberInvalid)
                                              ? Color(0xFF1D6EA0)
                                              : Colors.red)),
                                  icon: const Icon(Icons.numbers),
                                  iconColor: (isItemNumberInvalid)
                                      ? Color(0xFF1D6EA0)
                                      : Colors.red,
                                  labelText: "የገባው የእቃዉ ብዛት",
                                  labelStyle: const TextStyle(
                                    color: Color(0xFF1D6EA0),
                                  ),
                                  hoverColor: Colors.amberAccent),
                              cursorColor: Colors.black),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 35, top: 50),
                          child: TextField(
                              keyboardType: TextInputType.number,
                              controller: tottalPaymentItem,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: (tottalPaymentItemvalid)
                                              ? Color(0xFF1D6EA0)
                                              : Colors.red)),
                                  icon: const Icon(Icons.attach_money_rounded),
                                  iconColor: (tottalPaymentItemvalid)
                                      ? Color(0xFF1D6EA0)
                                      : Colors.red,
                                  labelText: "የተከፈላው የገንዘብ መጠን",
                                  labelStyle: const TextStyle(
                                    color: Color(0xFF1D6EA0),
                                  ),
                                  hoverColor: Colors.amberAccent),
                              cursorColor: Colors.black),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 25, right: 35, top: 50),
                          child: TextField(
                              keyboardType: TextInputType.datetime,
                              controller: itemArrivalTimeAndDate,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              (itemAarrivalTimeAndDateIsValid)
                                                  ? Color(0xFF1D6EA0)
                                                  : Colors.red)),
                                  icon: const Icon(Icons.timer),
                                  iconColor: (itemAarrivalTimeAndDateIsValid)
                                      ? Color(0xFF1D6EA0)
                                      : Colors.red,
                                  labelText: "እቃው የገባበት ሰአት አና ቀን",
                                  labelStyle: const TextStyle(
                                    color: Color(0xFF1D6EA0),
                                  ),
                                  hoverColor: Colors.amberAccent),
                              cursorColor: Colors.black),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 40, bottom: 15),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 300,
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    //  filepciker
                                    final result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                      allowMultiple: false,
                                      dialogTitle: "Select Brocuhers Image",
                                    );
                                    if (result != null) {
                                      final path = result.files.single.path!;
                                      final fileObject = File(path);
                                      _imageFile = fileObject;
                                      setState(() {
                                        _imageFile;
                                      });
                                    }
                                  },
                                  icon: const Icon(Icons.upload_file),
                                  label: const Text("የ ክፍያ ደረሰኝ በመስል"),
                                  style: ElevatedButton.styleFrom(
                                    iconColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: _imageFile == null
                                    ? Text("No receipt chosen")
                                    : Image.file(
                                        _imageFile!,
                                        width: 300,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 350,
                            height: 50,
                            margin: const EdgeInsets.only(top: 50, bottom: 5),
                            child: ElevatedButton(
                              onPressed: () async {
                                //  save the data
                                //  check if an image is null  show toast messsage that its required to have an image
                                if (_imageFile == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        // rounded corner for snack bar
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFF1D6EA0),
                                              width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        backgroundColor: Colors.grey[50],
                                        elevation: 10,
                                        content: const Text(
                                          "የ ደረሰኝ ምስሉን ማስገባቶን ያረጋግጡር",
                                          style: TextStyle(
                                              color: Color(0xFF1D6EA0),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                  );
                                  return;
                                }
                                bool allValid = true;
                                if (itemName.text.toString().isEmpty) {
                                  allValid = false;
                                  isItemNameInvalid = false;
                                } else {
                                  isItemNameInvalid = true;
                                }

                                if (itemNumber.text.toString().isEmpty) {
                                  allValid = false;
                                  isItemNumberInvalid = false;
                                } else {
                                  isItemNumberInvalid = true;
                                }

                                if (tottalPaymentItem.text.toString().isEmpty) {
                                  allValid = false;
                                  tottalPaymentItemvalid = false;
                                } else {
                                  tottalPaymentItemvalid = true;
                                }
                                if (itemArrivalTimeAndDate.text
                                    .toString()
                                    .isEmpty) {
                                  allValid = false;
                                  itemAarrivalTimeAndDateIsValid = false;
                                } else {
                                  itemAarrivalTimeAndDateIsValid = true;
                                }

                                setState(() {
                                  itemAarrivalTimeAndDateIsValid;
                                  tottalPaymentItemvalid;
                                  isItemNumberInvalid;
                                  isItemNameInvalid;
                                });

                                try {
                                  int.parse(itemNumber.text);
                                } catch (e) {
                                  allValid = false;
                                  isItemNumberInvalid = false;
                                }

                                try {
                                  double.parse(tottalPaymentItem.text);
                                } catch (e) {
                                  allValid = false;
                                  tottalPaymentItemvalid = false;
                                }

                                if (!allValid) {
                                  return;
                                }
                                //  save into the json file
                                //  clear the text field

                                PurchasedItems purchasedItems = PurchasedItems(
                                    itemName: itemName.text,
                                    itemCount: int.parse(itemNumber.text),
                                    payedPrice:
                                        double.parse(tottalPaymentItem.text),
                                    dateAndTimeOfArrival:
                                        itemArrivalTimeAndDate.text,
                                    recipetImage: _imageFile!.path);

                                await PurchasedItems.addNewData(purchasedItems);

                                itemName.text = "";
                                itemNumber.text = "";
                                tottalPaymentItem.text = "";
                                itemArrivalTimeAndDate.text = "";

                                //  collect all the data and send it to the api

                                String responseMessage = "ተመዝግቧል";
                                //  show a toast message that the data is saved

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                      SnackBar(
                                          duration: Duration(seconds: 1),
                                          // rounded corner for snack bar
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Color(0xFF1D6EA0),
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          backgroundColor: Colors.grey[50],
                                          elevation: 10,
                                          content: Text(
                                            responseMessage,
                                            style: const TextStyle(
                                              color: Color(0xFF1D6EA0),
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    )
                                    .closed
                                    .then((_) {
                                  // Navigator.pop(context);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                "መዝግብ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
