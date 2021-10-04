import 'dart:math';

class CalculatorBrain {
  int weight;
  int height;

  double _bmi;

  CalculatorBrain({
    this.weight,
    this.height,
  }) {
    _bmi = weight / pow(height / 100, 2);
  }

  String getBmi() {
    return _bmi.toStringAsFixed(1);
  }

  Map<String, String> getResult() {
    if (_bmi >= 25)
      return {
        "Overweight":
            "You have a higher than normal body weight. Try to exercise more.",
      };
    else if (_bmi >= 18.5)
      return {"Normal": "You have a normal body weight. Good job!"};
    else
      return {
        "Underweight":
            "You have a lower than normal body weight. You can eat a bit more."
      };
  }
}
