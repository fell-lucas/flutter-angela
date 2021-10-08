import 'package:flutter/material.dart';

class CheckboxItem extends StatelessWidget {
  const CheckboxItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: true,
      onChanged: (value) {},
      activeColor: Colors.lightBlueAccent,
      title: const Text(
        'Buy bread',
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }
}
