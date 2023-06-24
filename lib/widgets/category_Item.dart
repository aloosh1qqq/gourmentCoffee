import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gourmentcofe/main.dart';
import 'package:progress_state_button/progress_button.dart';

import '../test.dart';
import 'main_button.dart';

class CategoryItme extends StatefulWidget {
  CategoryItme(
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
  State<CategoryItme> createState() => _CategoryItmeState();
}

class _CategoryItmeState extends State<CategoryItme> {
  late TextEditingController _titleControler;
  late TextEditingController _priceControler;
  late TextEditingController _subTitleeControler;
  ButtonState stateTextWithIcon = ButtonState.idle;
  bool isLooding = false;
  @override
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
    bool subIsNotEmp = false;
    if (widget.subTitle != null) {
      subIsNotEmp = true;
    }
    // Future<String?> openDialog() => showDialog(
    //       context: context,
    //       builder: (builder) => AlertDialog(
    //         title: const Text("Edit"),
    //         content: SizedBox(
    //           height: 150,
    //           child: Column(
    //             children: [
    //               TextField(
    //                 controller: _titleControler,
    //               ),
    //               TextField(
    //                 controller: _priceControler,
    //               ),
    //               TextField(
    //                 decoration: const InputDecoration(
    //                   hintText: 'Enter Subtitle *(not required)',
    //                 ),
    //                 controller: _subTitleeControler,
    //               )
    //             ],
    //           ),
    //         ),
    //         actions: [
    //           Row(
    //             children: [
    //               TextButton(
    //                 onPressed: () async {
    //                   try {
    //                     await FirebaseFirestore.instance
    //                         .collection('product')
    //                         .doc(widget.docId)
    //                         .update({
    //                       'items': FieldValue.arrayRemove([
    //                         {
    //                           'id': widget.id,
    //                           'name': widget.title,
    //                           'price': widget.price,
    //                           if (subIsNotEmp) 'subTitle': widget.subTitle
    //                         }
    //                       ])
    //                     });
    //                     await FirebaseFirestore.instance
    //                         .collection('product')
    //                         .doc(widget.docId)
    //                         .update({
    //                       'items': FieldValue.arrayUnion([
    //                         {
    //                           'id': widget.id,
    //                           'name': _titleControler.text,
    //                           'price': double.parse(_priceControler.text),
    //                           if (_subTitleeControler.text.isNotEmpty)
    //                             'subTitle': _subTitleeControler.text
    //                         }
    //                       ])
    //                     });

    //                     Navigator.pop(context);
    //                     Navigator.pop(context);
    //                   } catch (e) {
    //                     Fluttertoast.showToast(msg: e.toString());
    //                   }
    //                 },
    //                 child: const Text("Save"),
    //                 // stateTextWithIcon: stateTextWithIcon,
    //               ),
    //               TextButton(
    //                 onPressed: () {
    //                   Navigator.pop(context);
    //                 },
    //                 child: const Text("Cancel"),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     );
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 250,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
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
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "€\t",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Color(0xffd17842)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
