import 'package:flutter/material.dart';

class CheckboxItem extends StatefulWidget {
  const CheckboxItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<CheckboxItem> createState() => _CheckboxItemState();
}

class _CheckboxItemState extends State<CheckboxItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
      activeColor: Colors.lightBlueAccent,
      title: Text(
        widget.text,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
