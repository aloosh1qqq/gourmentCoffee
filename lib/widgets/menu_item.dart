import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  MenuItem(this.image, this.title, this.price, this.rating);

  dynamic image, title, price, rating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 100,
          child: Container(
            // padding: EdgeInsets.all(12.0),
            // margin: EdgeInsets.only(right: 10),
            height: 80,
            width: 225,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xffb99746),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25)),
                  child: Icon(
                    Icons.remove,
                    color: Color(0xffb99746),
                  ),
                ),
                Text(
                  "0",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Color(0xffb99746),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                image,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
        ),
        // Container(
        //   margin: EdgeInsets.only(right: 15),
        //   height: 25.0,
        //   width: 50.0,
        //   decoration: BoxDecoration(
        //     color: Color(0xff231715),
        //     borderRadius: BorderRadius.only(
        //       topRight: Radius.circular(20.0),
        //       bottomLeft: Radius.circular(20.0),
        //     ),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Icon(
        //         Icons.star,
        //         size: 15,
        //         color: Color(0xffd17842),
        //       ),
        //       Text(
        //         "4.5",
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //           color: Colors.white,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
