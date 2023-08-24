import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'global.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final String titleText;
  final TextStyle titleStyle;
  final String subtitleText;
  final Widget child;

  const MyCard({
    super.key,
    this.color = kActiveCardColor,
    this.titleText = "",
    this.titleStyle = kMyCardTitleTextStyle,
    this.subtitleText = "",
    this.child = const SizedBox(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          titleText != ""
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titleText,
                    style: titleStyle
                  ),
                ),
              )
            : const SizedBox(height: 0)
          ,
          Expanded(child: child),
        ],
      ),
    );
  }
}

class MyTappableCard extends StatelessWidget {
  final Color color;
  final String titleText;
  final String subtitleText;
  final Widget child;
  final VoidCallback onPressed;

  const MyTappableCard({
    super.key,
    this.color = kActiveCardColor,
    this.titleText = "",
    this.subtitleText = "",
    this.child = const SizedBox(),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: MyCard(
        color: color,
        titleText: titleText,
        subtitleText: subtitleText,
        child: child,
      ),
    );
  }
}

class MyCardIcon extends StatelessWidget {
  final Icon icon;
  final String label;

  const MyCardIcon({
    super.key,
    this.icon = const Icon(FontAwesomeIcons.info),
    this.label = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 15),
        Text(
          label,
          style: kMyCardTitleTextStyle,
        )
      ]
    );
  }
}

class MyCardDoubleUnit extends StatelessWidget {
  final String unit;
  final double value;
  final TextStyle style;

  const MyCardDoubleUnit({
    super.key,
    this.unit = "",
    this.value = 180,
    this.style = kBMIValueTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Text(
            value.toStringAsFixed(1),
            style: kBMIValueTextStyle,
          ),
        ),
        unit != ""
          ? Text(
              unit,
              style: kMyCardTitleTextStyle,
            )
          : const SizedBox(width: 0)
        ,
      ],
    );
  }
}

class MyCardSlider extends StatelessWidget {
  final Function(double) onChanged;
  final double value;
  final String unit;

  const MyCardSlider({
    super.key,
    required this.onChanged,
    this.value = 180,
    this.unit = "cm",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyCardDoubleUnit(
          value: value,
          unit: unit,
        ),
        SliderTheme(
          data: kMySliderThemeData,
          child: Slider(
            min: kSliderMinHeight,
            max: kSliderMaxHeight,
            value: value,
            onChanged: onChanged,
          )
        )
      ],
    );
  }
}

class MyCardIntUnit extends StatelessWidget {
  final String unit;
  final int value;

  const MyCardIntUnit({
    super.key,
    this.unit = "",
    this.value = 180,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7),
          child: Text(
            value.toString(),
            style: kBMIValueTextStyle,
          ),
        ),
        unit != ""
          ? Text(
              unit,
              style: kMyCardTitleTextStyle,
            )
          : const SizedBox(width: 0)
        ,
      ],
    );
  }
}

class MyRoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const MyRoundButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed(),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      elevation: 6,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF8D8E98),
      child: Icon(icon),
    );
  }
}

class MyCardValueScale extends StatelessWidget {
  final Function(int) onPlusPressed;
  final Function(int) onMinusPressed;
  final String unit;
  final int value;

  const MyCardValueScale({
    super.key,
    required this.onPlusPressed,
    required this.onMinusPressed,
    this.value = 42,
    this.unit = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        unit != ""
          ? MyCardIntUnit(value: value, unit: unit)
          : MyCardIntUnit(value: value)
        ,
        const SizedBox(width: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyRoundButton(
              onPressed: () => onMinusPressed(value),
              icon: FontAwesomeIcons.minus,
            ),
            const SizedBox(width: 10),
            MyRoundButton(
              onPressed: () => onPlusPressed(value),
              icon: FontAwesomeIcons.plus,
            )
          ],
        )
      ],
    );
  }
}
