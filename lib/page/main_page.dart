import 'package:flutter/material.dart';
import 'package:gourmentcofe/widgets/carouser_slider.dart';
import 'package:gourmentcofe/widgets/item_wiget.dart';
import 'package:gourmentcofe/widgets/search_box.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8e9iuApdgXSY-NoYRwopQGDFWV4zvwDBGoB72nqMhNxMVpsXdlr_GsBD9BuyI4r5GT0E&usqp=CAU',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQduwlwMlw9_ifFd_P1RZ9_Of657lWzqDspew&usqp=CAU',
];

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbedc1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Image.asset("assets/image/Gourmet_Logo.png"),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SearchBox(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CarouselWithDotsPage(imgList: imgList),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                      height: 1000,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // عدد الأعمدة في الشبكة
                            mainAxisSpacing:
                                8.0, // المسافة العمودية بين العناصر
                            crossAxisSpacing:
                                8.0, // المسافة الأفقية بين العناصر
                            childAspectRatio:
                                0.8, // نسبة العرض إلى الارتفاع لكل عنصر
                          ),
                          itemCount: 3,
                          itemBuilder: (con, ind) {
                            return CatigoryWidget(
                              images: "assets/image/Gourmet_Logo.png",
                              name: "koffe",
                              price: "5",
                              title: "sadf",
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                width: double.maxFinite,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
