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
  GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: new AppBar(
        title: const Text('Title'),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Text("Drawer Header"),
            ),
            ListTile(
                title: Text("Item 1"),
                onTap: () {
                  Navigator.pop(context);
                }),
            ListTile(title: Text("Item 2"), onTap: () {}),
            ListTile(title: Text("Item 3"), onTap: () {}),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: FloatingActionButton(
            onPressed: () {
              _key.currentState.openDrawer();
            },
          ),
        ),
      ),
    );
  }
}
