import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/theme_globals.dart';
import 'package:bmi_calculator/widgets/calculate_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalculatorBrain cb =
        ModalRoute.of(context).settings.arguments as CalculatorBrain;

    final String result = cb.getResult().keys.first.toUpperCase();
    final String bmi = cb.getBmi();
    final String interpretation = cb.getResult().values.first;

    final TextStyle resultStyle = result == 'OVERWEIGHT'
        ? kResultOverweightTextStyle
        : (result == 'NORMAL'
            ? kResultNormalTextStyle
            : result == 'UNDERWEIGHT'
                ? kResultUnderweightStyle
                : kResultNormalTextStyle);

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      bottomNavigationBar: CalculateButton(
        text: 'RE-CALCULATE',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kBoldNormalTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        result,
                        style: resultStyle,
                      ),
                      Text(
                        bmi,
                        style: kBoldBigTextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kResultTipTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
