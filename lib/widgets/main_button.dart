import 'package:flutter/material.dart';
import 'package:gourmentcofe/screens/main_screen.dart';
import 'package:gourmentcofe/them.dart';

class MainButton extends StatelessWidget {
  MainButton({Key? key, required this.onTap, required this.title})
      : super(key: key);
  VoidCallback onTap;
  String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child: Text(title,
            style: TextStyle(
                color: AppTheme.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      ),
    );
  }
}
