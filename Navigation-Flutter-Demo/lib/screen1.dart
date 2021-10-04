import 'package:flutter/material.dart';
import 'package:navigation_demo_starter/screen2.dart';

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Screen 1'),
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          child: Text('Go Forwards To Screen 2'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Screen2(),
              ),
            );
          },
        ),
      ),
    );
  }
}
