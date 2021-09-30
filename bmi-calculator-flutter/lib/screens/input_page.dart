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
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  ReusableCard(),
                  SizedBox(width: 15),
                  ReusableCard(),
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

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    Key key,
    this.color = const Color(0xFF1d1f33),
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
