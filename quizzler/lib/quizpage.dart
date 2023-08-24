// Packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// Quiz Class
import 'quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Quiz quiz = Quiz();

  void showAlertDialog(){
    Alert(
      context: context,
      style: const AlertStyle(
        isCloseButton: false,
        isOverlayTapDismiss: false,
      ),
      title: "End of the quiz",
      desc: "Your accuracy rate is ${quiz.getAccuracy()}%.",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              quiz.reset();
            });
          },
          child: const Text(
            "Retry",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        DialogButton(
          onPressed: () {
            exit(0);
          },
          child: const Text(
            "Close App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        )
      ]
    ).show();
  }

  void giveResponse(answer){
    setState(() {
      bool correct = quiz.checkAnswer(answer);
      quiz.updateScore(correct);
      if (!quiz.nextQuestion()){
        showAlertDialog();
      }
    });
  }

  EdgeInsets buttonPadding = const EdgeInsets.symmetric(
    horizontal: 8.0,
    vertical: 64.0,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0
              ),
              child: Text(
                quiz.getQuestion(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: ElevatedButton(
                    onPressed: () => giveResponse(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      "True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                )
              ),
              Expanded(
                child: Padding(
                  padding: buttonPadding,
                  child: ElevatedButton(
                    onPressed: () => giveResponse(false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: const Text(
                      "False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  )
                )
              )
            ]
          ),
        ),
        Row(
          children: quiz.getScore(),
        )
      ],
    );
  }
}
