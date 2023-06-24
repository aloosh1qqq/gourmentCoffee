// import 'package:coffee_shop/detail_page.dart';
// import 'package:coffee_shop/widgets/category_Item.dart';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gourmentcofe/main.dart';
import 'package:gourmentcofe/models/item_model.dart';
import 'package:gourmentcofe/test.dart';
import 'package:gourmentcofe/widgets/category_Item.dart';
import 'package:progress_state_button/progress_button.dart';

class CatigoryWidget extends StatefulWidget {
  CatigoryWidget(
      {super.key,
      required this.docsId,
      required this.images,
      required this.items,
      required this.title});
  String images, title;
  List<ItemModel> items = [];
  String docsId;
  bool isLooding = false;
  @override
  State<CatigoryWidget> createState() => _CatigoryWidgetState();
}

late TextEditingController _titleControler;
late TextEditingController _priceControler;
late TextEditingController _subTitleeControler;

class _CatigoryWidgetState extends State<CatigoryWidget> {
  ButtonState stateTextWithIcon = ButtonState.idle;
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleControler = TextEditingController();
    _priceControler = TextEditingController();
    _subTitleeControler = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceControler.dispose();
    _subTitleeControler.dispose();
    _titleControler.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(0),
              ),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                  color: Color(0xfffbedc1),
                ),
              ],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.images),
              ),
              // borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              color: Color(0xffd17842),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     openDialog();
          //   },
          //   child: preferences.getString("userType").toString() != "admin"
          //       ? Container()
          //       : const Text(
          //           "+ Add Item",
          //           style: TextStyle(color: Colors.red),
          //         ),
          // ),
          // const SizedBox(
          //   height: 10,
          // ),
          SizedBox(
              height: 200,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: widget.items.length,
                    itemBuilder: (contaxt, index) {
                      return CategoryItme(
                          id: widget.items[index].id,
                          title: widget.items[index].name,
                          price: widget.items[index].price,
                          subTitle: widget.items[index].subTitle ??
                              widget.items[index].subTitle,
                          docId: widget.docsId);
                    }),
              )),
        ],
      ),
    );
  }
}
