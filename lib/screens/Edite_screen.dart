import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:gourmentcofe/models/catigory_Modle.dart';

import '../models/item_model.dart';
import '../widgets/category_Item.dart';
import '../widgets/edit_item.dart';
import '../widgets/item_wiget.dart';

class EditScreen extends StatefulWidget {
  EditScreen({super.key, required this.catigoryModel});
  final catigoryModel;
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _titleControler;
  late TextEditingController _priceControler;
  late TextEditingController _subTitleeControler;
  late MaterialStatesController _btControlar;
  ValueNotifier<bool> _buttonEnabled = ValueNotifier<bool>(true);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleControler = TextEditingController();
    _priceControler = TextEditingController();
    _subTitleeControler = TextEditingController();
    _btControlar = MaterialStatesController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceControler.dispose();
    _subTitleeControler.dispose();
    _titleControler.dispose();
  }

  Future<String?> openDialog() => showDialog(
        context: context,
        builder: (builder) => AlertDialog(
          title: const Text("Add Item"),
          content: SizedBox(
            height: 150,
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Item name',
                  ),
                  controller: _titleControler,
                ),
                TextField(
                  controller: _priceControler,
                  decoration: const InputDecoration(
                    hintText: 'Enter Price ',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Subtitle',
                  ),
                  controller: _subTitleeControler,
                )
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  statesController: _btControlar,
                  onPressed: () async {
                    // Navigator.pop(context);

                    if (_titleControler.text.isNotEmpty &&
                        _priceControler.text.isNotEmpty) {
                      await FirebaseFirestore.instance
                          .collection('product')
                          .doc(widget.catigoryModel.id)
                          .update({
                            'items': FieldValue.arrayUnion([
                              {
                                'id': Random().nextInt(100),
                                'name': _titleControler.text,
                                'price': double.parse(_priceControler.text),
                                if (_subTitleeControler.text.isNotEmpty)
                                  'subTitle': _subTitleeControler.text
                                else
                                  'subTitle': null
                              }
                            ])
                          })
                          .then((value) => {
                                _priceControler.clear(),
                                _subTitleeControler.clear(),
                                _titleControler.clear(),
                                Fluttertoast.showToast(
                                    msg:
                                        "The item has been added successfully"),
                                setState(() {
                                  _buttonEnabled.value = false;
                                }),
                              })
                          .catchError((e) {
                            Fluttertoast.showToast(msg: e.message);
                          });
                    } else {
                      Fluttertoast.showToast(
                          msg: "Item name and price rquired");
                    }
                  },
                  child: const Text("Add"),
                  // stateTextWithIcon: stateTextWithIcon,
                ),
                TextButton(
                  onPressed: () {
                    _priceControler.clear();
                    _subTitleeControler.clear();
                    _titleControler.clear();
                    Navigator.pop(context);
                  },
                  child: const Text("Exit"),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    print(widget.catigoryModel["title"]);
    List<ItemModel> items = (widget.catigoryModel['items'] as List<dynamic>)
        .map((itemJson) => ItemModel.fromJson(itemJson))
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/back.jpg'),
            ),
          ),
          child: Column(
            children: [
              Flexible(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.catigoryModel["image"]),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        widget.catigoryModel["title"],
                        style: TextStyle(
                            color: Color(0xffd17842),
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                      ),
                    ],
                  )),
              Flexible(
                flex: 5,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) => EditItem(
                    docId: widget.catigoryModel.id,
                    id: items[index].id,
                    price: items[index].price,
                    title: items[index].name,
                    subTitle: items[index].subTitle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          openDialog();
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black,
          ),
          child: Center(
              child: Icon(
            Icons.add,
            color: Colors.white,
          )),
        ),
      ),
    );
  }
}
