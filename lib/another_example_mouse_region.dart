import 'package:flutter/material.dart';

class MouseRegionCount extends StatefulWidget {
  const MouseRegionCount({Key? key}) : super(key: key);

  @override
  State<MouseRegionCount> createState() => _MouseRegionCountState();
}

class _MouseRegionCountState extends State<MouseRegionCount> {
  int enterCounter = 0;
  int exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void incrementEnter(PointerEvent details) {
    setState(() {
      enterCounter++;
    });
  }

  void incrementExit(PointerEvent details) {
    setState(() {
      exitCounter++;
    });
  }

  void update(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints.tight(const Size(300.0, 200.0)),
          child: MouseRegion(
            onEnter: incrementEnter,
            onHover: update,
            onExit: incrementExit,
            child: Container(
              color: Colors.lightBlueAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                      'You have entered or exited this box this many times:'),
                  Text(
                    '$enterCounter Entries\n$exitCounter Exits',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
