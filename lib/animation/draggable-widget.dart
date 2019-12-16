import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

Widget App() {
  return MaterialApp(
    home: Scaffold(
      body: Example(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    ),
  );
}

class Example extends StatefulWidget {
  final Widget child;
  Example({this.child});

  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Alignment dragAlignment = Alignment.center;
  Animation<Alignment> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    controller.addListener(() {
      setState(() {
        dragAlignment = animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  runReverseAnimation(Offset pixelsPerSecond, Size size) {
    animation = controller.drive(
      AlignmentTween(
        begin: dragAlignment,
        end: Alignment.center,
      ),
    );

    // copied :)
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          dragAlignment += Alignment(
            details.delta.dx / (size.width / 2),
            details.delta.dy / (size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        runReverseAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: Align(
        alignment: dragAlignment,
        child: widget.child,
      ),
    );
  }
}
