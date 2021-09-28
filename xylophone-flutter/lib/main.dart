import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  Widget buildKey({int note, Color color}) {
    return Expanded(
      child: MaterialButton(
        color: color,
        onPressed: () {
          player.play('note$note.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(color: Colors.red, note: 1),
                buildKey(color: Colors.orange, note: 2),
                buildKey(color: Colors.yellow, note: 3),
                buildKey(color: Colors.green, note: 4),
                buildKey(color: Colors.teal, note: 5),
                buildKey(color: Colors.blue, note: 6),
                buildKey(color: Colors.purple, note: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
