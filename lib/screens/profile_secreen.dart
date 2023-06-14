import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
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
                        point: LatLng(53.6040378, 9.943963410),
                        width: 100,
                        height: 100,
                        builder: (context) => Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset("assets/image/Gourmet_Logo.png"),
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
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        Padding(
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
                  SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "Elligersweg 5, 22307 Hamburg, Germany",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/smartphone-svgrepo-com.svg",
                    height: 26,
                    color: Color(0xffd17842),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "+963 999 999 4568",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/time-quarter-to-svgrepo-com.svg",
                    height: 26,
                    color: Color(0xffd17842),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "17h - 24h",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/website-ui-web-svgrepo-com.svg",
                    height: 26,
                    color: Color(0xffd17842),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                  Text(
                    "www.GourmentCoffee.com",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
