import 'package:flutter/material.dart';

Widget App() {
  return MaterialApp(
    home: Example(),
  );
}

class Example extends StatelessWidget {
  GlobalKey<ScaffoldState> key1 = GlobalKey<ScaffoldState>();

  SnackBar getSnackBar(String text) {
    return SnackBar(
      content: Text(text),
      action: SnackBarAction(
        label: 'action',
        onPressed: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key1,
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            // Scaffold.of(context).showSnackBar(getSnackBar('testing'));
            key1.currentState.showSnackBar(
                getSnackBar('testing something and something else ...'));
          },
        ),
      ),
    );
  }
}
