// import 'package:coffee_shop/detail_page.dart';
// import 'package:coffee_shop/widgets/category_Item.dart';
import 'package:flutter/material.dart';
import 'package:gourmentcofe/models/item_model.dart';
import 'package:gourmentcofe/widgets/category_Item.dart';

class CatigoryWidget extends StatelessWidget {
  CatigoryWidget(
      {super.key,
      required this.images,
      required this.items,
      required this.title});
  String images, title;
  List<ItemModel> items = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      // Color(0xfffbedc1),
      child: Container(
        // height: 500,
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black,
          //  Color(0xff17191f)
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          // image: DecorationImage(
          //     image: AssetImage("assets/images/Black_Pattern.png")
          // )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(0),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    spreadRadius: 1.0,
                    color: Color(0xfffbedc1),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
                // borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                color: Color(0xffd17842),
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 200,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (contaxt, index) {
                        return CategoryItme(
                            items[index].name, items[index].price.toString());
                      }),
                )),
          ],
        ),
      ),
    );
  }

  List<String> names = [
    "Englische Mischung",
    "Grüntee",
    "Lemon Fresh",
    "Pfefferminze",
    "Kamille",
    "Frische Ingwer-Zitronen Tee",
    "Frische Pfefferminzetee",
    "Heisse-Zitrone",
  ];
}
