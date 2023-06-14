import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gourmentcofe/main.dart';

import 'main_button.dart';

class CategoryItmePage extends StatefulWidget {
  CategoryItmePage(
      {required this.docId,
      required this.title,
      required this.price,
      this.subTitle,
      required this.id});
  String title, docId;
  int id;
  double price;
  String? subTitle;

  @override
  State<CategoryItmePage> createState() => _CategoryItmePageState();
}

class _CategoryItmePageState extends State<CategoryItmePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            if (widget.subTitle != null)
              SizedBox(
                width: 280,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  widget.subTitle!,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Text(
              widget.price.toString(),
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "\$\t",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xffd17842)),
            ),
          ],
        ),
      ],
    );
  }
}
