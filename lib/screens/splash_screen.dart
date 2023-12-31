import 'package:flutter/material.dart';
import 'package:gourmentcofe/main.dart';
import 'package:gourmentcofe/screens/main_screen.dart';
import 'package:gourmentcofe/screens/signup_screen.dart';
import 'package:gourmentcofe/them.dart';
import 'package:gourmentcofe/widgets/image_slider.dart';
import 'package:gourmentcofe/widgets/main_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../test.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              height: size.height / 1.5,
              child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const SingleChildScrollView(child: ImageSlider());
                },
                itemCount: 1,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8),
            //   child: SmoothPageIndicator(
            //     controller: controller,
            //     count: 1,
            //     effect: WormEffect(
            //       activeDotColor: Colors.black,
            //       dotColor: AppTheme.darkColor.withOpacity(0.3),

            //       dotHeight: 12,
            //       dotWidth: 12,
            //       type: WormType.normal,
            //       // strokeWidth: 5,
            //     ),
            //   ),
            // ),
            const Spacer(),
            // MyCustomWidget(),
            MainButton(
                title: 'Get Started',
                onTap: () {
                  preferences.setString("userName", "Gust");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Main_screen()));
                }),
            const Spacer(),
            // Forgot Password
            // Container(
            //   margin: const EdgeInsets.all(5),
            //   child: TextButton(
            //       onPressed: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => const SignupPage()));
            //       },
            //       child: const Text("LogIn Or SignUp")),
            // ),
          ],
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/image/back.jpg'),
          ),
        ),
      ),
    );
  }
}
