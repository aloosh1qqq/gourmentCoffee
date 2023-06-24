import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  bool isSelected;
  final String iconData;
  final String title;
  final VoidCallback ontap;
  final VoidCallback onlongTap;
  CategoryItem(
      {Key? key,
      required this.isSelected,
      required this.iconData,
      required this.title,
      required this.ontap,
      required this.onlongTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      onLongPress: onlongTap,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconData,
                height: 28,
                color: Color(0xffd17842),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
    );
  }
}
