import 'package:flutter/widgets.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Image.asset(
          'assets/image/splash.png',
          width: size.width / 1,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
          child: Text(
            'Kaffee so gut,\n Ihre Geschmacksknospen mit Liebe',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 8,
          ),
          child: Text(
            'Das beste Getreide, die feinste Röstung, der kräftigste Geschmack',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
