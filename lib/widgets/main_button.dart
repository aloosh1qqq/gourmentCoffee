import 'package:flutter/material.dart';
import 'package:gourmentcofe/screens/main_screen.dart';
import 'package:gourmentcofe/them.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Main_screen()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        alignment: Alignment.center,
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child: const Text('Get Started',
            style: TextStyle(
                color: AppTheme.whiteColor,
                fontWeight: FontWeight.w700,
                fontSize: 18)),
      ),
    );
  }
}
