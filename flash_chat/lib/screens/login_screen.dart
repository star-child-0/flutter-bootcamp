import 'package:flutter/material.dart';

import '../utils/auth.dart';
import '../utils/globals.dart';
import 'chat_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Auth(
        authMode: AuthMode.login,
        color: kCeleste,
        onAuthenticated: () {
          Navigator.pushNamed(context, ChatScreen.id);
        },
      )
    );
  }
}
