import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import '../utils/globals.dart';
import '../utils/materials.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = '/welcome';

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppLogo(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        speed: const Duration(milliseconds: 300),
                      )
                    ],
                  )
                )
              ],
            ),
            const SizedBox(height: 48.0),
            RoundedButton(
              tag: 'login_button',
              onPressed: () => Navigator.pushNamed(context, LoginScreen.id),
              text: 'Log In',
            ),
            RoundedButton(
              tag: 'registration_button',
              onPressed: () => Navigator.pushNamed(context, RegistrationScreen.id),
              color: kAzure,
              text: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
