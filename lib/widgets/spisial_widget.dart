import 'package:flutter/material.dart';

class Spisial_Widget extends StatelessWidget {
  Spisial_Widget(this.image, this.title, this.subTitle, this.price, this.rating,
      {super.key});

  dynamic image, title, subTitle, price, rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 125,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff171b22),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                        color: Color(0xff30221f),
                      ),
                    ],
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        image,
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: const TextStyle(
                        color: Color(0xffaeaeae),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "\$\t",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffd17842),
                              ),
                            ),
                            Text(
                              price,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffd17842),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Icon(Icons.add,
                              size: 30, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15),
          height: 25.0,
          width: 50.0,
          decoration: const BoxDecoration(
            color: Color(0xff231715),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.star,
                size: 15,
                color: Color(0xffd17842),
              ),
              Text(
                "4.5",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
