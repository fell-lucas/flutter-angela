import 'package:bmi_calculator/theme_globals.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key key,
    this.color = kActiveBg,
    this.child,
    this.onTap,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
