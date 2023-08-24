import 'package:flutter/material.dart';

import 'globals.dart';

class AppLogo extends StatelessWidget {
  final double height;

  const AppLogo({
    super.key,
    this.height = 60.0
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: 'logo',
        child: SizedBox(
          height: height,
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String tag;
  final Function()? onPressed;
  final Color color;
  final String text;

  const RoundedButton({
    super.key,
    required this.tag,
    required this.onPressed,
    this.color = kCeleste,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: onPressed,
            minWidth: 200.0,
            height: 42.0,
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

class RoundedTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final String hintText;
  final Color color;

  const RoundedTextField({
    super.key,
    required this.onChanged,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.hintText = 'Hint Text',
    this.color = kCeleste,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final Color fillColor;

  const RoundedIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.fillColor = kAzure,
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
      fillColor: fillColor,
      child: Icon(icon),
    );
  }
}
