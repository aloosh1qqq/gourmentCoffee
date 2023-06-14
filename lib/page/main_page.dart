import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gourmentcofe/screens/main_screen.dart';
import 'package:gourmentcofe/widgets/carouser_slider.dart';
import 'package:gourmentcofe/widgets/catigory_widget_page.dart';
import 'package:gourmentcofe/widgets/item_wiget.dart';
import 'package:gourmentcofe/widgets/search_box.dart';
import 'package:latlong2/latlong.dart';

import '../models/item_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final hight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(width.toString());
    print(hight);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 950) {
        return Scaffold(
          backgroundColor: Color(0xfffbedc1),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/image/back.jpg'),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 20),
                                  child: Text(
                                    'Menue',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                ),
                                Divider(),
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection("product")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final caty =
                                            snapshot.data?.docs.toList();

                                        return MediaQuery.removePadding(
                                            context: context,
                                            removeTop: true,
                                            removeBottom: true,
                                            child: SizedBox(
                                              height: hight - 100,
                                              child: GridView.builder(
                                                  itemCount: caty!.length,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 2,
                                                          crossAxisSpacing: 15,
                                                          childAspectRatio:
                                                              1.1),
                                                  itemBuilder:
                                                      (itemBuilder, index) {
                                                    List<
                                                        ItemModel> items = (caty[
                                                                index]['items']
                                                            as List<dynamic>)
                                                        .map((itemJson) =>
                                                            ItemModel.fromJson(
                                                                itemJson))
                                                        .toList();
                                                    return CatigoryWidgetPage(
                                                      docsId: caty[index].id,
                                                      images: caty[index]
                                                          ["image"],
                                                      items: items,
                                                      title: caty[index]
                                                          ["title"],
                                                    );
                                                  }),
                                            ));
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    }),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                  left: -(width / 14) + 3,
                                  top: 0,
                                  bottom: 0,
                                  width: (width / 7) + 2,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/image/MenuElements.png"),
                                            fit: BoxFit.fitHeight)),
                                  )),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: width / 20, right: width / 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: (hight / 3) * 2,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Center(
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          child: Image.asset(
                                            "assets/image/Gourmet_Logo.png",
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: (hight / 3) / 1.5,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ))
                      // SizedBox(
                      //     height: MediaQuery.of(context).size.height * 0.02),
                    ],
                  ),
                  // SizedBox(
                  //   height: 25,
                  // ),
                  Row(
                    children: [
                      Flexible(
                          flex: 5,
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              height: hight / 3,
                              child: Stack(
                                children: [
                                  FlutterMap(
                                    options: MapOptions(
                                      center: LatLng(53.6040378, 9.943963410),
                                      zoom: 15,
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.example.app',
                                      ),
                                      MarkerLayer(
                                        markers: [
                                          Marker(
                                            point:
                                                LatLng(53.6040378, 9.943963410),
                                            width: 100,
                                            height: 100,
                                            builder: (context) => Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Image.asset(
                                                    "assets/image/Gourmet_Logo.png"),
                                                Positioned(
                                                    top: -30,
                                                    child: Icon(
                                                      Icons.place_outlined,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ))),
                      Flexible(
                          flex: 3,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/location-pin-svgrepo-com.svg",
                                        height: 26,
                                        color: Color(0xffd17842),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        "Elligersweg 5, 22307 Hamburg, Germany",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/smartphone-svgrepo-com.svg",
                                        height: 26,
                                        color: Color(0xffd17842),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        "+963 999 999 4568",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/time-quarter-to-svgrepo-com.svg",
                                        height: 26,
                                        color: Color(0xffd17842),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        "17h - 24h",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/website-ui-web-svgrepo-com.svg",
                                        height: 26,
                                        color: Color(0xffd17842),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      Text(
                                        "www.GourmentCoffee.com",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      } else {
        return Main_screen();
      }
    });
  }
}

//  GridView.count(
//                                         mainAxisSpacing: 1,
//                                         crossAxisSpacing: 25,
//                                         crossAxisCount:
//                                             2, // عدد العناصر في كل صف
//                                         // نسبة العرض إلى الارتفاع لكل عنصر
//                                         children: List.generate(caty!.length,
//                                             (index) {
//                                           List<ItemModel> items = (caty[index]
//                                                   ['items'] as List<dynamic>)
//                                               .map((itemJson) =>
//                                                   ItemModel.fromJson(itemJson))
//                                               .toList();
//                                           return CatigoryWidgetPage(
//                                             docsId: caty[index].id,
//                                             images: caty[index]["image"],
//                                             items: items,
//                                             title: caty[index]["title"],
//                                           );
//                                         }),
//                                       ));