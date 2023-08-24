import 'package:flutter/material.dart';

enum Sex{
  female,
  male
}

// App
const kBackgroundColor = Color(0xFF0A0E21);
const kBrightness = Brightness.dark;

// Text
const kMyCardTitleTextStyle = TextStyle(
  fontSize: 22,
  color: Color(0xFFB3B4Be)
);
const kMyCardValueTextStyle = TextStyle(
  fontSize: 60,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

// Card
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF111328);
const kSecondaryColor = Color(0xFFEB1555);
const kSecondaryColorAccent = Color(0x29EB1555);

// Bottom Container
const kBottomContainerHeight = 80.0;
const kBottomContainerTextStyle = TextStyle(
  fontSize: 25,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

// Slider
const kSliderMinHeight = 100.0;
const kSliderMaxHeight = 250.0;
const kMySliderThemeData = SliderThemeData(
  thumbShape: RoundSliderThumbShape(
    enabledThumbRadius: 15,
  ),
  thumbColor: kSecondaryColor,
  overlayShape: RoundSliderOverlayShape(
    overlayRadius: 30,
  ),
  overlayColor: kSecondaryColorAccent,
  activeTrackColor: kSecondaryColor,
  inactiveTrackColor: Color(0xFF8D8E98),
);

// Result
const kBMIResultHeaderTextStyle = TextStyle(
  fontSize: 50,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
const kBMIResultTitleTextStyle = TextStyle(
  fontSize: 25,
  color: Color(0xFF24D876),
  fontWeight: FontWeight.bold,
);
const kBMIValueTextStyle = TextStyle(
  fontSize: 90,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
