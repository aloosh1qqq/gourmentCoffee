import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gourmentcofe/screens/profile_secreen.dart';
import 'package:gourmentcofe/them.dart';
import 'package:gourmentcofe/widgets/bottom_bar.dart';
import 'package:gourmentcofe/widgets/carouser_slider.dart';
import 'package:gourmentcofe/widgets/home_header.dart';
import 'package:gourmentcofe/widgets/item_wiget.dart';
import 'package:gourmentcofe/widgets/search_box.dart';

import 'menu_screen.dart';

class Main_screen extends StatefulWidget {
  Main_screen({super.key});

  @override
  State<Main_screen> createState() => _Main_screenState();
}

class _Main_screenState extends State<Main_screen> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS8e9iuApdgXSY-NoYRwopQGDFWV4zvwDBGoB72nqMhNxMVpsXdlr_GsBD9BuyI4r5GT0E&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQduwlwMlw9_ifFd_P1RZ9_Of657lWzqDspew&usqp=CAU',
    ];
    final List<Widget> pages = [
      MenuScreen(),
      SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rabatte und Angebote \nfür dich:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CarouselWithDotsPage(imgList: imgList),

              // CatigoryWidget(
              //   images: "assets/image/Gourmet_Logo.png",
              //   name: "koffe",
              //   price: "5",
              //   title: "sadf",
              // ),
            ],
          ),
        ),
      ),
      ProfileScreen(),
      Container(),
    ];

    return Scaffold(
        // appBar: PreferredSize(child: Header(), preferredSize: Size(400, 80)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xffd17842),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/menu-alt-05-svgrepo-com.svg',
                  height: 28,
                ),
                label: 'Menu'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home-svgrepo-com.svg',
                  height: 28,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/profile-svgrepo-com.svg',
                  height: 28,
                ),
                label: 'Profile'),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        backgroundColor: Color(0xfffbedc1),
        body: Container(
          height: 1000,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/back.jpg'),
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Header(),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Image.asset("assets/image/Gourmet_Logo.png"),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      SearchBar(),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  pages[_currentIndex],
                ],
              ),
            ),
          ),
        ));
  }
}
