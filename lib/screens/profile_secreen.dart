import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
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
    );
  }
}
