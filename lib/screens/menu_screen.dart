import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gourmentcofe/models/item_model.dart';
import 'package:gourmentcofe/widgets/category_card.dart';
import 'package:gourmentcofe/widgets/item_wiget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    print(preferences.getString("userType").toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            'Menue',
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
          height: 300,
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
                        crossAxisSpacing: 15.0, // المسافة الأفقية بين العناصر
                        childAspectRatio: 3.5, // نسبة عرض العنصر إلى ارتفاعه
                      ),
                      itemBuilder: (itemBuilder, index) {
                        List<ItemModel> items =
                            (caty[index]['items'] as List<dynamic>)
                                .map((itemJson) => ItemModel.fromJson(itemJson))
                                .toList();
                        return CategoryItem(
                          iconData:
                              'assets/icons/coffee-cup-coffee-svgrepo-com.svg',
                          title: caty[index]["title"],
                          isSelected: false,
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
                                double height = screenHeight;

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
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Nachwal',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Butter",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("70 \$"),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Hönig",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("70 \$"),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    overflow: TextOverflow.fade,
                    "Konfiture",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("70 \$"),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "Käse",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("90 \$"),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Gekochte Eier",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("1.30 \$"),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    overflow: TextOverflow.fade,
                    "Spiegelei",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("1.90 \$"),
                  SizedBox(
                    width: 15,
                  ),
                ],
              )
            ],
          ),
        )
        // GestureDetector(
        //     onTap: () async {
        //       var collection = FirebaseFirestore.instance.collection("product");
        //       collection.add(catigory[6].toJson());
        //     },
        //     child: const Center(
        //       child: Icon(
        //         Icons.add,
        //         size: 100,
        //       ),
        //     )),
      ],
    );
  }
}
