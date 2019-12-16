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
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: activeIndex,
        onTap: (int acitve) {
          setState(() {
            activeIndex = acitve;
          });
          // // setState(() {
          // // activeIndex = active;
          // // });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text('two'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            title: Text('one'),
          ),
        ],
      ),
    );
  }
}
