import 'package:bmi_calculator/theme_globals.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      bottomNavigationBar: Container(
        height: bottomNavHeight,
        color: bottomNavColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReusableCard(
                    child: IconContent(
                      icon: Icons.male,
                      text: 'MALE',
                    ),
                  ),
                  SizedBox(width: 15),
                  ReusableCard(
                    child: IconContent(
                      icon: Icons.female,
                      text: 'FEMALE',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            ReusableCard(),
            SizedBox(height: 15),
            Expanded(
              child: Row(
                children: [
                  ReusableCard(),
                  SizedBox(width: 15),
                  ReusableCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
