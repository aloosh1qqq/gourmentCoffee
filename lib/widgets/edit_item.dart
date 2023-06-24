import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gourmentcofe/main.dart';
import 'package:progress_state_button/progress_button.dart';

import '../test.dart';
import 'main_button.dart';

class EditItem extends StatefulWidget {
  EditItem(
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
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  late TextEditingController _titleControler;
  late TextEditingController _priceControler;
  late TextEditingController _subTitleeControler;
  ButtonState stateTextWithIcon = ButtonState.idle;
  bool isLooding = false;
  bool isLooding2 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleControler = TextEditingController();
    _priceControler = TextEditingController();
    _subTitleeControler = TextEditingController();
    _titleControler.text = widget.title;
    _priceControler.text = widget.price.toString();
    if (widget.subTitle != null) {
      _subTitleeControler.text = widget.subTitle!;
    }
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
    bool subIsNotEmp = false;
    if (widget.subTitle != null) {
      subIsNotEmp = true;
    }

    return Container(
      child: isLooding
          ? Center(child: Container())
          : isLooding2
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(15),
                  height: 230,
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleControler,
                      ),
                      TextField(
                        controller: _priceControler,
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: 'Enter Subtitle *(not required)',
                        ),
                        controller: _subTitleeControler,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            margin: const EdgeInsets.only(top: 8),
                            child: MyCustomWidget(
                              icon: Icons.save,
                              text: "save",
                              stateTextWithIcon: stateTextWithIcon,
                              ontap: () async {
                                try {
                                  setState(() {
                                    // ضع isLoading على true
                                    isLooding2 = true;
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('product')
                                      .doc(widget.docId)
                                      .update({
                                    'items': FieldValue.arrayRemove([
                                      {
                                        'id': widget.id,
                                        'name': widget.title,
                                        'price': widget.price,
                                        if (subIsNotEmp)
                                          'subTitle': widget.subTitle
                                        else
                                          'subTitle': null
                                      }
                                    ])
                                  });
                                  await FirebaseFirestore.instance
                                      .collection('product')
                                      .doc(widget.docId)
                                      .update({
                                    'items': FieldValue.arrayUnion([
                                      {
                                        'id': widget.id,
                                        'name': _titleControler.text,
                                        'price':
                                            double.parse(_priceControler.text),
                                        if (_subTitleeControler.text.isNotEmpty)
                                          'subTitle': _subTitleeControler.text
                                        else
                                          'subTitle': null
                                      }
                                    ])
                                  });
                                  setState(() {
                                    // ضع isLoading على true
                                    isLooding2 = false;
                                  });
                                } catch (e) {
                                  Fluttertoast.showToast(msg: e.toString());
                                }
                              },
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            margin: const EdgeInsets.only(top: 8),
                            child: MyCustomWidget(
                              color: Colors.red,
                              icon: Icons.delete,
                              text: "Delete",
                              stateTextWithIcon: stateTextWithIcon,
                              ontap: () async {
                                setState(() {
                                  // ضع isLoading على true
                                  isLooding = true;
                                });
                                await FirebaseFirestore.instance
                                    .collection('product')
                                    .doc(widget.docId)
                                    .update({
                                      'items': FieldValue.arrayRemove([
                                        {
                                          'id': widget.id,
                                          'name': widget.title,
                                          'price': widget.price,
                                          if (subIsNotEmp)
                                            'subTitle': widget.subTitle
                                          else
                                            'subTitle': null
                                        }
                                      ])
                                    })
                                    .then(((value) => Null))
                                    .catchError((e) {
                                      Fluttertoast.showToast(msg: e!.message);
                                    });
                                // setState(() {
                                //   // ضع isLoading على true
                                //   isLooding = false;
                                // });
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
    );
  }
}
