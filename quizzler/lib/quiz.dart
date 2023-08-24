// Packages
import 'package:flutter/material.dart';

// Question Class
import 'question.dart';

class Quiz{
  int _current = 0;
  final List<Icon> _score = [];
  final List<Question> _questions = [
    Question(question: "A slug's blood is green.", answer: true),
    Question(
      question: "Some cats are actually allergic to humans",
      answer: true
    ),
    Question(
      question: "Buzz Aldrin's mother's maiden name was 'Moon'.",
      answer: true
    ),
    Question(
      question: "It is illegal to pee in the Ocean in Portugal.",
      answer: true
    ),
    Question(
      question: "You can lead a cow down stairs but not up stairs.",
      answer: false
    ),
    Question(
      question: "Approximately one quarter of human bones are in the feet.",
      answer: true
    ),
    Question(
      question: "No piece of square dry paper can be folded in half more than 7 times.",
      answer: false
    ),
    Question(
      question: "The total surface area of two human lungs is approximately 70 square metres.",
      answer: true
    ),
    Question(
      question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.",
      answer: false
    ),
    Question(
      question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.",
      answer: true
    ),
    Question(
      question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.",
      answer: true
    ),
    Question(
      question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.",
      answer: true
    ),
  ];

  Quiz(){
    _questions.shuffle();
  }

  String getQuestion(){
    try{
      return _questions[_current].question;
    }
    catch(e){
      return "End of the quiz";
    }
  }

  bool nextQuestion(){
    if (_current < _questions.length){
      _current++;
    }

    return _current == _questions.length ? false : true;
  }

  List<Icon> getScore(){
    return _score;
  }

  void updateScore(correct){
    Icon icon = const Icon(Icons.check);

    if (correct){
      icon = const Icon(
        Icons.check,
        color: Colors.green,
      );
    }
    else {
      icon = const Icon(
        Icons.close,
        color: Colors.red,
      );
    }

    _score.add(icon);
  }

  String getAccuracy(){
    int s = 0;
    for (int i = 0; i < _score.length; i++){
      if (_score[i].color == Colors.green){
        s++;
      }
    }

    return (s / _questions.length * 100).toStringAsFixed(2);
  }

  bool checkAnswer(answer){
    return _questions[_current].answer == answer ? true : false;
  }

  void reset(){
    _current = 0;
    _score.clear();
    _questions.shuffle();
  }
}
