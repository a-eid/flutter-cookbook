import 'package:flutter/material.dart';

Widget App() {
  return MaterialApp(
    home: Scaffold(
      body: Example(),
    ),
  );
}

class Example extends StatefulWidget {
  Example({Key key}) : super(key: key);

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AnimatedOpacity(
          opacity: visible ? 1 : 0,
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: 400),
          child: Container(
            height: 200,
            color: Colors.pink,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              visible = !visible;
            });
          },
          child: Icon(Icons.flip),
        )
      ],
    );
  }
}
