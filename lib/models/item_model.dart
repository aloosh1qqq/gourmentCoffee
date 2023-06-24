import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String name;
  int id;
  double price;
  String? subTitle;

  ItemModel(
      {required this.id,
      required this.name,
      required this.price,
      this.subTitle});
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      price: (json['price']) as double,
      subTitle: json['subTitle'],
    );
  }
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'price': price, 'subTitle': subTitle};
  factory ItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic> data = snapshot.data()!;
    return ItemModel(
      id: data['id'],
      name: data['name'],
      price: data['price'],
      subTitle: data['subTitle'],
    );
  }
}
