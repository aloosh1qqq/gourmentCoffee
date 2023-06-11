import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  bool isSelected;
  final String? iconData;
  final String title;
  final VoidCallback ontap;
  CategoryItem(
      {Key? key,
      required this.isSelected,
      required this.iconData,
      required this.title,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
          // margin: const EdgeInsets.all(5),

          decoration: BoxDecoration(
            //   boxShadow: [
            //     BoxShadow(
            //       color: !isSelected
            //           ? Colors.grey.withOpacity(0.3)
            //           : Colors.transparent,
            //       spreadRadius: 2,
            //       blurRadius: 5,
            //       offset: const Offset(0, 3),
            //     ),
            //   ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xffd17842),
                fontWeight: FontWeight.w600,
              ),
            ),
          )),
    );
  }
}
