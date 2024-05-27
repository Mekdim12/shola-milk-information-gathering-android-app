import 'dart:convert';
import 'dart:io';


import 'package:path_provider/path_provider.dart';

class PurchasedItems {
  final String itemName;
  final int itemCount;
  final double payedPrice;
  final String dateAndTimeOfArrival;
  final String recipetImage;

  PurchasedItems(
      {required this.itemName,
      required this.itemCount,
      required this.payedPrice,
      required this.dateAndTimeOfArrival,
      required this.recipetImage});

  factory PurchasedItems.fromJson(Map<String, dynamic> json) {
    return PurchasedItems(
        itemName: json['itemName'],
        itemCount: json['itemCount'],
        payedPrice: json['payedPrice'],
        dateAndTimeOfArrival: json['dateAndTimeOfArrival'],
        recipetImage: json['recipetImage']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["itemName"] = this.itemName;
    data["itemCount"] = this.itemCount;
    data["payedPrice"] = this.payedPrice;
    data["dateAndTimeOfArrival"] = this.dateAndTimeOfArrival;
    data["recipetImage"] = this.recipetImage;

    return data;
  }

  static List<PurchasedItems> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => PurchasedItems.fromJson(json)).toList();
  }

//  write a way to add coming {}to the json file if file exist and add the new data to the file
  static Future<void> addNewData(PurchasedItems purchasedItems) async {
    final List<PurchasedItems> purchasedItemsList = await PurchasedItems.readData();
    purchasedItemsList.add(purchasedItems);
    await PurchasedItems.writeData(purchasedItemsList);
  }

  static Future<List<PurchasedItems>> readData() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/purchasedItems.json');

    if (!await file.exists()) {
      return [];
    }

    final contents = await file.readAsString();
    List<dynamic> json = jsonDecode(contents);
    return json.map((item) => PurchasedItems.fromJson(item)).toList();
  }

  static Future<void> writeData(List<PurchasedItems> purchasedItems) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/purchasedItems.json');

    final data = jsonEncode(purchasedItems.map((item) => item.toJson()).toList());
    await file.writeAsString(data);
  }

  // static Future<List<PurchasedItems>> readData() async {
  //   try {
  //     final String data = await File('purchasedItems.json').readAsString();
  //     final List<dynamic> jsonList = jsonDecode(data);
  //     return PurchasedItems.fromJsonList(jsonList);
  //   } catch (e) {
  //     return [];
  //   }
  // }
  
}
