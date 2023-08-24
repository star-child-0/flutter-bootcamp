import 'package:flutter/material.dart';

import 'package:bmi_calculator/pages/input.dart';
import 'global.dart';
import 'package:bmi_calculator/pages/result.dart';

class BMIApp extends StatelessWidget {
  const BMIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kBackgroundColor,
          brightness: kBrightness,
        ),
      ),
      initialRoute: '/',
      routes: {
        InputPage.routeName: (context) => const InputPage(),
        ResultPage.routeName: (context) => const ResultPage(),
      },
    );
  }
}

class BMIScaffold extends StatelessWidget{
  final Widget body;

  const BMIScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: body,
    );
  }
}

class BMIBottomPageButton extends StatelessWidget{
  final VoidCallback onPressed;
  final String text;

  const BMIBottomPageButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: kSecondaryColor,
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              text,
              style: kBottomContainerTextStyle,
            ),
          ),
        )
      )
    );
  }
}
