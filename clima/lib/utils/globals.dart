import 'package:flutter/material.dart';

const TextStyle kWeatherMedium = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 25.0,
);

const kgrey900 = Color.fromARGB(255, 49, 49, 49);

const TextStyle kWeatherMediumForm = TextStyle(
  fontFamily: 'Spartan MB',
  color: kgrey900,
  fontSize: 25.0,
);

const kTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: "City Name",
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

const TextStyle kWeatherLarge = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 45.0,
);

const TextStyle kWeatherHuge = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 65.0,
);

const errorDictionary = {
  400: "Bad Request",
  401: "Unauthorized",
  403: "Forbidden",
  404: "Not Found",
  500: "Internal Server Error",
  502: "Bad Gateway",
};
