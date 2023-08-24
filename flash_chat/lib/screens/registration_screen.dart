import 'package:flutter/material.dart';

import '../utils/auth.dart';
import '../utils/globals.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatelessWidget {
  static const String id = '/registration';

  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Auth(
        authMode: AuthMode.register,
        color: kAzure,
        onAuthenticated: () {
          Navigator.pushNamed(context, ChatScreen.id);
        },
      )
    );
  }
}
