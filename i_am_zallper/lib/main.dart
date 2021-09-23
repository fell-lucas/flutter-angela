import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('I am Zallper'),
        backgroundColor: const Color(0xff2e2a3e),
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/z_transparent.png'),
        ),
      ),
    ),
  ));
}
