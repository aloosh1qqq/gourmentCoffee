import 'package:flutter/material.dart';

class CategoryItme extends StatelessWidget {
  CategoryItme(this.title, this.price);
  String title, price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              price,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "\$\t",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xffd17842)),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.add,
              size: 25,
              color: Color(0xffd17842),
            ),
            Icon(
              Icons.remove,
              size: 25,
              color: Color(0xffd17842),
            ),
          ],
        ),
      ],
    );
  }
}
