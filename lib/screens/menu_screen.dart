import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gourmentcofe/models/catigory_Modle.dart';
import 'package:gourmentcofe/models/item_model.dart';
import 'package:gourmentcofe/screens/Edite_screen.dart';
import 'package:gourmentcofe/widgets/category_card.dart';
import 'package:gourmentcofe/widgets/item_wiget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data.dart';
import '../main.dart';
import 'login_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    // // preferences.setString("userType", "");
    // print(preferences.getString("userType").toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            'Menu',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Divider(),
        Container(
          padding: EdgeInsets.all(15),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/back.jpg'),
            ),
          ),
          height: 350,
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection("product").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final caty = snapshot.data?.docs.toList();

                  return GridView.builder(
                      itemCount: caty!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // عدد الأعمدة المطلوبة
                        mainAxisSpacing: 15.0, // المسافة العمودية بين العناصر
                        crossAxisSpacing: 25.0, // المسافة الأفقية بين العناصر
                        childAspectRatio: 3, // نسبة عرض العنصر إلى ارتفاعه
                      ),
                      itemBuilder: (itemBuilder, index) {
                        List<ItemModel> items =
                            (caty[index]['items'] as List<dynamic>)
                                .map((itemJson) => ItemModel.fromJson(itemJson))
                                .toList();
                        return CategoryItem(
                          iconData: caty[index]["icon"],
                          title: caty[index]["title"],
                          isSelected: false,
                          onlongTap: () {
                            if (preferences.get("userType") != 'admin') {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const LoginPage(),
                                  transitionDuration:
                                      Duration(milliseconds: 500),
                                  transitionsBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation,
                                      Widget child) {
                                    return ScaleTransition(
                                      scale: Tween<double>(
                                        begin: 0,
                                        end: 1,
                                      ).animate(CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.fastOutSlowIn,
                                      )),
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            } else {
                              if (preferences.getString("userType") ==
                                  'admin') {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        EditScreen(
                                      catigoryModel: caty[index],
                                    ),
                                    transitionDuration:
                                        Duration(milliseconds: 500),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secondaryAnimation,
                                        Widget child) {
                                      return ScaleTransition(
                                        scale: Tween<double>(
                                          begin: 0,
                                          end: 1,
                                        ).animate(CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.fastOutSlowIn,
                                        )),
                                        child: child,
                                      );
                                    },
                                  ),
                                );
                              }
                            }
                          },
                          ontap: () {
                            // preferences.clear();
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled:
                                  true, // تمكين التمرير لنافذة الأسفل
                              builder: (builder) {
                                // حساب ارتفاع الشاشة
                                double screenHeight =
                                    MediaQuery.of(context).size.height;
                                // تعيين ارتفاع النافذة النمطية
                                double height = screenHeight / 1.5;

                                return Container(
                                  height:
                                      height, // تعيين ارتفاع النافذة النمطية
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: CatigoryWidget(
                                    docsId: caty[index].id,
                                    images: caty[index]["image"],
                                    items: items,
                                    title: caty[index]["title"],
                                  ),
                                );
                              },
                            );
                          },
                        );
                      });
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              }),
        ),
        Divider(),
        GestureDetector(
            onTap: () async {
              // for (int i = 7; i < catigory.length; i--) {
              //   var collection =
              //       FirebaseFirestore.instance.collection("product");
              //   collection.add(catigory[i].toJson());
              // }
            },
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/restaurant-menu-svgrepo-com.svg',
                height: 100,
              ),
            )),
      ],
    );
  }
}
