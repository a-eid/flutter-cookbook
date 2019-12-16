import 'package:flutter/material.dart';

Widget App() {
  return MaterialApp(home: Page1());
}

class Page1 extends StatelessWidget {
  const Page1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(createRoute(Page2()));
          },
          child: Text("To Page 2"),
        ),
      ),
    );
  }
}

Route createRoute(page) {
  // traditional ios/android animation
  // return MaterialPageRoute(builder: (BuildContext ctx) {
  // return page;
  // });

  return PageRouteBuilder(
    // build page...
    pageBuilder: (context, animation, secondaryAnimation) => page,

    // build transition
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      Animatable<Offset> tween = Tween(begin: Offset(1, 0), end: Offset.zero)
          // to add an easing curve... ( should work without it);
          .chain(CurveTween(curve: Curves.easeInOut));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("To Page 1"),
        ),
      ),
    );
  }
}
