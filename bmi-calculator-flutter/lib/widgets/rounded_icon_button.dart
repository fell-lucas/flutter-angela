import 'package:bmi_calculator/theme_globals.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    Key key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kInactiveText,
      child: Icon(
        icon,
        size: 36.0,
      ),
    );
  }
}
