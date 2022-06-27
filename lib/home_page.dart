import 'package:flutter/material.dart';

class MouseRegions extends StatefulWidget {
  const MouseRegions({Key? key}) : super(key: key);

  @override
  State<MouseRegions> createState() => _MouseRegionsState();
}

class _MouseRegionsState extends State<MouseRegions> {
  String status = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mouse Status :$status'),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              opaque: false,
              onEnter: (s) {
                setState(() {
                  status = 'Mouse Entered in region';
                });
              },
              onHover: (s) {
                setState(() {
                  status = 'Mouse Hovering is region';
                });
              },
              onExit: (s) {
                setState(() {
                  status = 'Mouse exit is region';
                });
              },
              child: Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
