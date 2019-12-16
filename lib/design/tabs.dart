import 'package:flutter/material.dart';

Widget App() {
  return MaterialApp(
    home: Example(),
  );
}

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: <Widget>[
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ));
  }
}
