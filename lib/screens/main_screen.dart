import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gourmentcofe/widgets/bottom_bar.dart';
import 'package:gourmentcofe/widgets/carouser_slider.dart';
import 'package:gourmentcofe/widgets/item_wiget.dart';
import 'package:gourmentcofe/widgets/search_box.dart';

class Main_screen extends StatefulWidget {
  Main_screen({super.key});

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8e9iuApdgXSY-NoYRwopQGDFWV4zvwDBGoB72nqMhNxMVpsXdlr_GsBD9BuyI4r5GT0E&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQduwlwMlw9_ifFd_P1RZ9_Of657lWzqDspew&usqp=CAU',
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Menu",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
            backgroundColor: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      backgroundColor: Color(0xfffbedc1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                CatigoryWidget(
                  images: "assets/image/Gourmet_Logo.png",
                  name: "koffe",
                  price: "5",
                  title: "sadf",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
