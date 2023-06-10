// import 'package:coffee_shop/detail_page.dart';
// import 'package:coffee_shop/widgets/category_Item.dart';
import 'package:flutter/material.dart';
import 'package:gourmentcofe/widgets/category_Item.dart';

class CatigoryWidget extends StatelessWidget {
  CatigoryWidget(
      {super.key,
      required this.images,
      required this.name,
      required this.price,
      required this.title});
  String images, title, price, name;
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
                height: 410,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (contaxt, index) {
                        return CategoryItme(name, price);
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
