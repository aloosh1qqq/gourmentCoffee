// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gourmentcofe/widgets/category_card.dart';

// class Categories extends StatelessWidget {
//   const Categories({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 300,
//       child: GridView.builder(
//           itemCount: cat.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // عدد الأعمدة المطلوبة
//             mainAxisSpacing: 10.0, // المسافة العمودية بين العناصر
//             crossAxisSpacing: 10.0, // المسافة الأفقية بين العناصر
//             childAspectRatio: 3.0, // نسبة عرض العنصر إلى ارتفاعه
//           ),
//           itemBuilder: (itemBuilder, index) {
//             return CategoryItem(
//               iconData: 'assets/icons/coffee-cup-coffee-svgrepo-com.svg',
//               title: cat[index],
//               isSelected: false,
//             );
//           }),
//     );
//   }
// }


// CategoryItem(
//                         iconData: 'assets/icons/coffee-svgrepo-com.svg',
//                         title: 'Kaffee und co.',
//                         isSelected: false,
//                       ),
//                       CategoryItem(
//                         iconData: 'assets/icons/coffee-svgrepo-com.svg',
//                         title: 'Limonade und EisTee',
//                         isSelected: false,
//                       ),
//                       CategoryItem(
//                         iconData: 'assets/icons/coffee-svgrepo-com.svg',
//                         title: 'Kalte Getränke',
//                         isSelected: false,
//                       ),
//                       CategoryItem(
//                         iconData: 'assets/icons/coffee-svgrepo-com.svg',
//                         title: 'Salat',
//                         isSelected: false,
//                       ),
//                       CategoryItem(
//                         iconData: 'assets/icons/coffee-svgrepo-com.svg',
//                         title: 'Frühstück',
//                         isSelected: false,
//                       ),
//                       CategoryItem(
//                         iconData: 'assets/icons/coffee-svgrepo-com.svg',
//                         title: 'Belegte Brotschen',
//                         isSelected: false,
//                       ),