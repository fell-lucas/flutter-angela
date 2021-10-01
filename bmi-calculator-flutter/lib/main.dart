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
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: kActiveBg,
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: Colors.white,
          inactiveTrackColor: kInactiveText,
          thumbColor: kRedAccentColor,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayColor: kRedAccentTransparentColor,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
      ),
      home: InputPage(),
    );
  }
}
