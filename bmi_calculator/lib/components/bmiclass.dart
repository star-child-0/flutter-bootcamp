import 'dart:math';

class BMI {
  final double height;
  final int weight;

  BMI({
    required this.height,
    required this.weight,
  });

  double _calculate(double height, int weight) {
    return weight / pow(height / 100, 2);
  }

  Map getResult(double height, int weight) {
    double bmi = _calculate(height, weight);
    if (bmi >= 25) {
      return {
        'bmi': bmi.toStringAsFixed(1),
        'bmiDouble': bmi,
        'result': 'Overweight',
        'interpretation': 'You have a higher than normal body weight. Try to exercise more.'
      };
    }
    else if (bmi >= 18.5) {
      return {
        'bmi': bmi.toStringAsFixed(1),
        'bmiDouble': bmi,
        'result': 'Normal',
        'interpretation': 'You have a normal body weight. Good job!'
      };
    }
    else {
      return {
        'bmi': bmi.toStringAsFixed(1),
        'bmiDouble': bmi,
        'result': 'Underweight',
        'interpretation': 'You have a lower than normal body weight. You can eat a bit more.'
      };
    }
  }
}
