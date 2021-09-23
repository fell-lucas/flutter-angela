import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('I am Rich'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: const Center(
        child: Image(
          image: NetworkImage(
            'https://www.imagesource.com/wp-content/uploads/2019/06/Rio.jpg',
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey[300],
    ),
  ));
}
