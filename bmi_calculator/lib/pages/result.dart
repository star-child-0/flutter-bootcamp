import 'package:flutter/material.dart';

import 'package:bmi_calculator/components/bmiapp.dart';
import 'package:bmi_calculator/components/global.dart';
import 'package:bmi_calculator/components/mycard.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/result';

  const ResultPage({
    super.key,
  });

  void goBack(BuildContext context){
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bmi = ModalRoute.of(context)!.settings.arguments as Map;

    return BMIScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: kBMIResultHeaderTextStyle,
              )
            )
          ),
          Expanded(
            flex: 5,
            child: MyCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bmi["result"].toUpperCase(),
                        style: kBMIResultTitleTextStyle,
                      ),
                      MyCardDoubleUnit(
                        value: bmi["bmiDouble"],
                        style: kBMIValueTextStyle,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      bmi["interpretation"],
                      style: kMyCardTitleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BMIBottomPageButton(
            onPressed: () => goBack(context),
            text: "Go Back",
          ),
        ],
      ),
    );
  }
}
