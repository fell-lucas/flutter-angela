import 'package:bmi_calculator/theme_globals.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key key, this.icon, this.text}) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: inactiveText,
        ),
        SizedBox(height: 15),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
