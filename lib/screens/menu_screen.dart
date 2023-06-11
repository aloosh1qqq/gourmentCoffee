import 'package:flutter/material.dart';
import 'package:gourmentcofe/models/catigory_Modle.dart';
import 'package:gourmentcofe/models/item_model.dart';
import 'package:gourmentcofe/widgets/categories.dart';
import 'package:gourmentcofe/widgets/category_card.dart';
import 'package:gourmentcofe/widgets/item_wiget.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Text(
            'Categories',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/back.jpg'),
            ),
          ),
          height: 1000,
          child: GridView.builder(
              itemCount: cat.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة المطلوبة
                mainAxisSpacing: 15.0, // المسافة العمودية بين العناصر
                crossAxisSpacing: 15.0, // المسافة الأفقية بين العناصر
                childAspectRatio: 3.5, // نسبة عرض العنصر إلى ارتفاعه
              ),
              itemBuilder: (itemBuilder, index) {
                return CategoryItem(
                  iconData: 'assets/icons/coffee-cup-coffee-svgrepo-com.svg',
                  title: cat[index],
                  isSelected: false,
                  ontap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      isScrollControlled: true, // تمكين التمرير لنافذة الأسفل
                      builder: (builder) {
                        // حساب ارتفاع الشاشة
                        double screenHeight =
                            MediaQuery.of(context).size.height;
                        // تعيين ارتفاع النافذة النمطية
                        double height = screenHeight / 1.5;

                        return Container(
                          height: height, // تعيين ارتفاع النافذة النمطية
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: CatigoryWidget(
                            images: catigory[0].image,
                            items: catigory[0].items,
                            title: catigory[0].title,
                          ),
                        );
                      },
                    );
                  },
                );
              }),
        ),

        // Categories(),
        // Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: CatigoryWidget(
        //     images: "assets/icons/coffee.png",
        //     name: "koffe",
        //     price: "14.3",
        //     title: "Tee sorten ",
        //   ),
        // ),
      ],
    );
  }

  List<CatigoryModel> catigory = [
    CatigoryModel(
      id: 1,
      title: "Tee sorten",
      image: "assets/image/1.jpg",
      items: [
        ItemModel(id: 1, name: "Englische Mischung", price: 2.90),
        ItemModel(id: 2, name: "Grüntee", price: 2.90),
        ItemModel(id: 3, name: "Lemon Fresh", price: 2.90),
        ItemModel(id: 4, name: "Pfefferminze", price: 2.90),
        ItemModel(id: 5, name: "Kamille", price: 2.90),
        ItemModel(id: 6, name: "Frische Ingwer-Zitronen Tee", price: 3.90),
        ItemModel(id: 5, name: "Frische Pfefferminzetee", price: 3.60),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
        ItemModel(id: 5, name: "Heisse-Zitrone", price: 2.80),
      ],
    )
  ];
  List<String> cat = [
    "Tee sorten",
    "kaffee und co",
    "Limonade und EisTee",
    "Kalte Getränke",
    "Salat",
    "Frühstück",
    "Belegte Brotschen"
  ];
  List<String> image = [
    "assets/image/1.jpg",
    "assets/image/2.jpg",
    "assets/image/5.jpg",
    "assets/image/6 .jpg",
    "assets/image/4.jpg",
    "assets/image/7.jpg",
    "assets/image/8.jpg",
  ];
}
