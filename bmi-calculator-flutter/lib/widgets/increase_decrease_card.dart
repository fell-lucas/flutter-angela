import 'package:bmi_calculator/theme_globals.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';

class IncreaseDecreaseCard extends StatelessWidget {
  const IncreaseDecreaseCard(
      {Key key,
      this.title,
      this.abbreviation,
      this.number,
      this.add,
      this.remove})
      : super(key: key);
  final String title;
  final String abbreviation;
  final int number;

  final Function add;
  final Function remove;
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: kInactiveTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                number.toString(),
                style: kBoldTextStyle,
              ),
              Text(
                abbreviation,
                style: kInactiveTextStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundedIconButton(
                icon: Icons.remove,
                onPressed: remove,
              ),
              SizedBox(
                width: 15.0,
              ),
              RoundedIconButton(
                icon: Icons.add,
                onPressed: add,
              ),
            ],
          )
        ],
      ),
    );
  }
}
