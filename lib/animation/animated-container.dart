import 'dart:math';

import 'package:flutter/material.dart';

Widget App() {
  return MaterialApp(
    home: Example(),
  );
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  double width = 200;
  double height = 200;
  Color color = Colors.blue;
  BorderRadiusGeometry borderRadius = BorderRadius.circular(8);

  Random random = Random();

  void animate() {
    setState(() {
      width =
          random.nextInt(MediaQuery.of(context).size.width.toInt()).toDouble();
      height =
          random.nextInt(MediaQuery.of(context).size.height.toInt()).toDouble();
      borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
      int r = random.nextInt(256);
      int g = random.nextInt(256);
      int b = random.nextInt(256);
      color = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.show_chart),
          onPressed: animate,
        ),
        body: Center(
          child: AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: color,
            ),
            width: width,
            height: height,
            curve: Curves.easeInOut,
            duration: Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}
