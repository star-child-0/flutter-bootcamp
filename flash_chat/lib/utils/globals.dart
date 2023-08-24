import 'package:flutter/material.dart';

const kCeleste = Colors.lightBlueAccent;
const kAzure = Colors.blueAccent;
const kBlack = Colors.black54;

const kSendButtonTextStyle = TextStyle(
  color: kCeleste,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: kCeleste, width: 2.0),
  ),
);
