import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmentcofe/page/main_page.dart';
import 'package:gourmentcofe/screens/main_screen.dart';
import 'package:gourmentcofe/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyC6JU3UZ95IEpf-HrSNZvbfLd8V8qaOykI",
  //         appId: "1:763314098857:web:0d59eaabced71e3c91cfb8",
  //         messagingSenderId: "763314098857",
  //         projectId: "gourmentcoffee-6a612"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Café Gourmet',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      home: SplashScreen(), // BottomPage()
    );
  }
}
