import 'package:flutter/cupertino.dart';

class Task extends ChangeNotifier {
  final String text;
  bool isChecked;
  Task({
    required this.text,
    this.isChecked = false,
  });

  void toggleDone() {
    isChecked = !isChecked;
  }
}
