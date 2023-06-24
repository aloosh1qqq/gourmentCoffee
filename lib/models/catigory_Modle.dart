// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_model.dart';

class CatigoryModel {
  String title, image, icon;
  int id;
  List<ItemModel> items;

  CatigoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.items,
    required this.icon,
  });

  factory CatigoryModel.fromJson(Map<String, dynamic> json) {
    return CatigoryModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        items: json['Items'],
        icon: json['icon']);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image': image,
        'items': items.map((item) => item.toJson()).toList(),
        'icon': icon
      };
  factory CatigoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return CatigoryModel(
        id: data['id'],
        title: data['title'],
        image: data['image'],
        items: (data['items'] as List)
            .map((itemJson) => ItemModel.fromSnapshot(itemJson))
            .toList(),
        icon: data['icon']);
  }
}
