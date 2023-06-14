import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Container(
              decoration: ShapeDecoration(
                color: Colors.yellowAccent.withOpacity(0.3),
                shape: const CircleBorder(),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  8.0 * animationController.value,
                ),
                child: child,
              ),
            );
          },
          child: Container(
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: () {
                print('button tapped');
              },
              color: Colors.blue,
              icon: Icon(
                Icons.calendar_today,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
