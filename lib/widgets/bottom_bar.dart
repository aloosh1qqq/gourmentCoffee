import 'package:flutter/material.dart';

class BottomNavCustom extends StatefulWidget {
  @override
  _BottomNavCustomState createState() => _BottomNavCustomState();
}

class _BottomNavCustomState extends State<BottomNavCustom> {
  int selectedIndex = 0;
  Color backgroundColorNav = Colors.black;

  List<NavigationItem> items = [
    NavigationItem(
      const Icon(
        Icons.home,
        color: Color.fromRGBO(91, 55, 183, 1),
      ),
      Text(
        'Home',
        style: TextStyle(
            color: Color.fromRGBO(91, 55, 183, 1), fontWeight: FontWeight.bold),
      ),
      Color.fromRGBO(223, 215, 243, 1),
    ),
    NavigationItem(
        Icon(Icons.favorite_border, color: Color.fromRGBO(201, 55, 157, 1)),
        Text(
          'Favorite',
          style: TextStyle(
              color: Color.fromRGBO(201, 55, 157, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(244, 211, 235, 1)),
    NavigationItem(
        Icon(
          Icons.search,
          color: Color.fromRGBO(230, 169, 25, 1),
        ),
        Text(
          'Search',
          style: TextStyle(
              color: Color.fromRGBO(230, 169, 25, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(251, 239, 211, 1)),
    NavigationItem(
        Icon(Icons.person_outline, color: Color.fromRGBO(17, 148, 170, 1)),
        Text(
          'Profile',
          style: TextStyle(
              color: Color.fromRGBO(17, 148, 170, 1),
              fontWeight: FontWeight.bold),
        ),
        Color.fromRGBO(0, 0, 0, 1))
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      height: 50,
      width: isSelected ? 120 : 50,
      padding: isSelected ? EdgeInsets.only(left: 16, right: 16) : null,
      decoration: isSelected
          ? BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.all(Radius.circular(50)))
          : null,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                  size: 24,
                  color: isSelected ? backgroundColorNav : Colors.black,
                ),
                child: item.icon,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: isSelected
                    ? DefaultTextStyle.merge(
                        style: TextStyle(color: backgroundColorNav),
                        child: item.title)
                    : Container(),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items.map((item) {
          var itemIndex = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = itemIndex;
              });
            },
            child: _buildItem(item, selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;
  final Color color;

  NavigationItem(this.icon, this.title, this.color);
}
