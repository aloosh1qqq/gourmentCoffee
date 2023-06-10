// ignore: file_names
import 'item_model.dart';

class CatigoryModel {
  String title, image;
  int id;
  List<ItemModel> items;
  CatigoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.items,
  });

  factory CatigoryModel.fromJson(Map<String, dynamic> json) {
    return CatigoryModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      items: json['Items'],
    );
  }
}
