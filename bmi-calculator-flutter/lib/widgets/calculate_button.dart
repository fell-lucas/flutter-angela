import 'package:bmi_calculator/theme_globals.dart';
import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: BoxConstraints.tightFor(
          height: kBottomNavHeight,
          width: double.infinity,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        fillColor: kRedAccentColor,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            text,
            style: kBoldSmallTextStyle,
          ),
        ),
      ),
    );
  }
}
