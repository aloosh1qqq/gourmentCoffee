// import 'package:coffee_shop/detail_page.dart';
// import 'package:coffee_shop/widgets/category_Item.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gourmentcofe/main.dart';
import 'package:gourmentcofe/models/item_model.dart';
import 'package:gourmentcofe/widgets/category_Item.dart';

import 'categori_item_page.dart';

class CatigoryWidgetPage extends StatefulWidget {
  CatigoryWidgetPage(
      {super.key,
      required this.docsId,
      required this.images,
      required this.items,
      required this.title});
  String images, title;
  List<ItemModel> items = [];
  String docsId;

  @override
  State<CatigoryWidgetPage> createState() => _CatigoryWidgetPageState();
}

late TextEditingController _titleControler;
late TextEditingController _priceControler;
late TextEditingController _subTitleeControler;
bool isLooding = false;

class _CatigoryWidgetPageState extends State<CatigoryWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xffd17842),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: isLooding // استخدم isLoading لعرض مؤشر التحميل إذا كان true
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: widget.items.length,
                      itemBuilder: (contaxt, index) {
                        return CategoryItmePage(
                            id: widget.items[index].id,
                            title: widget.items[index].name,
                            price: widget.items[index].price,
                            subTitle: widget.items[index].subTitle ??
                                widget.items[index].subTitle,
                            docId: widget.docsId);
                      }),
                ),
        ),
      ],
    );
  }
}
