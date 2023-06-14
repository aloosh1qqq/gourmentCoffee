import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmentcofe/page/main_page.dart';
import 'package:gourmentcofe/screens/login_screen.dart';
import 'package:gourmentcofe/screens/main_screen.dart';
import 'package:gourmentcofe/screens/signup_screen.dart';
import 'package:gourmentcofe/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

late SharedPreferences preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyC6JU3UZ95IEpf-HrSNZvbfLd8V8qaOykI",
          appId: "1:763314098857:web:0d59eaabced71e3c91cfb8",
          messagingSenderId: "763314098857",
          projectId: "gourmentcoffee-6a612"));
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: '/',
      routes: {
        '/': (context) {
          // if (preferences.getString("userName") == null)
          //   return const SplashScreen();
          // else {
          //   return Main_screen();
          // }
          return MainPage();
        },
        // '/onboarding': (context) => const OnBoarding(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => Main_screen(),
        // '/forgot': ((context) => const ForgotPassword())
      },
    );
  }
}
