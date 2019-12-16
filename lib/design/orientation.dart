import 'package:flutter/material.dart';

Widget App() {
  return MaterialApp(
    home: Example(),
  );
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OrientationBuilder(
        builder: (BuildContext ctx, orientation) {
          bool landscape = orientation == Orientation.landscape;
          return Scaffold(
            body: Center(
              child: Text(landscape ? "landscape" : "portrait"),
            ),
          );
        },
      ),
    );
  }
}
