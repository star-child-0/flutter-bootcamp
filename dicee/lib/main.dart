import 'package:flutter/material.dart';
import 'dart:math';

final random = Random();

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget
{
  const DicePage({super.key});

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage>
{
  int leftDiceNumber = random.nextInt(6) + 1;
  int rightDiceNumber = random.nextInt(6) + 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = random.nextInt(6) + 1;
      rightDiceNumber = random.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: TextButton(
            onPressed: rollDice,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                      image: AssetImage('images/dice$leftDiceNumber.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                      image: AssetImage('images/dice$rightDiceNumber.png')
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            '$leftDiceNumber + $rightDiceNumber = ${leftDiceNumber + rightDiceNumber}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        )
      ],
    );
  }
}
