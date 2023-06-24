import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gourmentcofe/screens/profile_secreen.dart';

import 'package:gourmentcofe/widgets/carouser_slider.dart';

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
      'assets/image/cobon1.jpg',
      'assets/image/cobon2.jpg'
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
              const Text(
                "Rabatte und Angebote \nfür dich:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CarouselWithDotsPage(imgList: imgList),
            ],
          ),
        ),
      ),
      ProfileScreen(),
      Container(),
    ];
    print(MediaQuery.of(context).size.height.toString());
    print(MediaQuery.of(context).size.width.toString());
    return Scaffold(

        // appBar: PreferredSize(child: Header(), preferredSize: Size(400, 80)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Color(0xffd17842),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/menu-alt-05-svgrepo-com.svg',
                  height: 28,
                  color: Colors.white,
                ),
                label: 'Menu'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/home-svgrepo-com.svg',
                  height: 28,
                  color: Colors.white,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/icons/location-pin-svgrepo-com.svg',
                  height: 28,
                  color: Colors.white,
                ),
                label: 'About us'),
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
                      // Header(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Center(
                          child: AnimatedContainer(
                            width: MediaQuery.of(context).size.width * 0.6,
                            duration: Duration(milliseconds: 500),
                            child: Image.asset(
                              "assets/image/Gourmet_Logo.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.03),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.6,
                      //   child: Image.asset("assets/image/Gourmet_Logo.png"),
                      // ),
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.03),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.8,
                      //   height: MediaQuery.of(context).size.height * 0.06,
                      //   decoration: const BoxDecoration(
                      //       color: Colors.black,
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(25),
                      //         topRight: Radius.circular(25),
                      //       )),
                      // )
                      // SearchBar(),
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
