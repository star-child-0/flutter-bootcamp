import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/components/bmiapp.dart';
import 'package:bmi_calculator/components/mycard.dart';
import 'package:bmi_calculator/components/global.dart';
import 'package:bmi_calculator/components/bmiclass.dart';

class InputPage extends StatefulWidget {
  static const routeName = '/';
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Sex selected = Sex.female;
  double height = 123;
  int weight = 42;
  int age = 21;

  void changeSex(Sex sex){
    setState(() {
      selected = sex;
    });
  }

  void changeHeight(double val){
    setState(() {
      height = val;
    });
  }

  void changeWeight(int val){
    setState(() {
      weight = val;
    });
  }

  void changeAge(int val){
    setState(() {
      age = val;
    });
  }

  void calculateBMI(){
    Navigator.pushNamed(
      context,
      '/result',
      arguments: BMI(height: height, weight: weight).getResult(height, weight)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BMIScaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: MyTappableCard(
                      onPressed: () => changeSex(Sex.female),
                      color: selected == Sex.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                      titleText: "",
                      subtitleText: "",
                      child: const MyCardIcon(
                        icon: Icon(
                          FontAwesomeIcons.venus,
                          color: Colors.white,
                          size: 80,
                        ),
                        label: "Female",
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyTappableCard(
                      onPressed: () => changeSex(Sex.male),
                      color: selected == Sex.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                      titleText: "",
                      subtitleText: "",
                      child: const MyCardIcon(
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          color: Colors.white,
                          size: 80,
                        ),
                        label: "Male",
                      ),
                    )
                  )
                ],
              ),
            ),
            Expanded(
              child: MyCard(
                titleText: "Height",
                child: MyCardSlider(
                  value: height,
                  unit: "cm",
                  onChanged: (double val) => changeHeight(val),
                ),
              )
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: MyCard(
                      titleText: "Weight",
                      child: MyCardValueScale(
                        onPlusPressed: (int val) => changeWeight(++val),
                        onMinusPressed: (int val) => changeWeight(--val),
                        value: weight,
                        unit: "kg",
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyCard(
                      titleText: "Age",
                      child: MyCardValueScale(
                        onPlusPressed: (int val) => changeAge(++val),
                        onMinusPressed: (int val) => changeAge(--val),
                        value: age,
                      )
                    ),
                  ),
                ],
              ),
            ),
            BMIBottomPageButton(
              onPressed: () => calculateBMI(),
              text: "Calculate your BMI",
            ),
          ],
        ),
      )
    );
  }
}
