import 'package:bmi_calculator/theme_globals.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:bmi_calculator/widgets/increase_decrease_card.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/rounded_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      bottomNavigationBar: Container(
        height: kBottomNavHeight,
        color: kRedAccentColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onTap: () => setState(() {
                        selectedGender = Gender.male;
                      }),
                      color: selectedGender == Gender.male
                          ? kActiveBg
                          : kInactiveBg,
                      child: IconContent(
                        icon: Icons.male,
                        text: 'MALE',
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: ReusableCard(
                      onTap: () => setState(() {
                        selectedGender = Gender.female;
                      }),
                      color: selectedGender == Gender.female
                          ? kActiveBg
                          : kInactiveBg,
                      child: IconContent(
                        icon: Icons.female,
                        text: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
                child: ReusableCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kInactiveTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kBoldTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kInactiveTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double val) {
                      setState(() {
                        height = val.round();
                      });
                    },
                  )
                ],
              ),
            )),
            SizedBox(height: 15),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: IncreaseDecreaseCard(
                      title: 'WEIGHT',
                      abbreviation: 'kg',
                      number: weight,
                      add: () {
                        setState(() {
                          weight++;
                        });
                      },
                      remove: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: IncreaseDecreaseCard(
                      title: 'AGE',
                      abbreviation: '',
                      number: age,
                      add: () {
                        setState(() {
                          age++;
                        });
                      },
                      remove: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
