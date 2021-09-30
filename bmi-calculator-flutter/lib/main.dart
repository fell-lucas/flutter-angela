import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/theme_globals.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: activeBg,
        ),
      ),
      home: InputPage(),
    );
  }
}
