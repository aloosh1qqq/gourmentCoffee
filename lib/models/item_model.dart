class ItemModel {
  String name;
  int id;
  double price;

  ItemModel({
    required this.id,
    required this.name,
    required this.price,
  });
  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}
