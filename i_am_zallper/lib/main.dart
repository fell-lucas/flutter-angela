import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('I am Zallper'),
        backgroundColor: const Color(0xff2e2a3e),
      ),
      body: const Center(
        child: Image(
          image: AssetImage('images/z_transparent.png'),
        ),
      ),
      backgroundColor: Colors.grey[100],
    ),
  ));
}
