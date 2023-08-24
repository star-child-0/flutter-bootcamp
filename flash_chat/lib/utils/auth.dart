import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../utils/materials.dart';

enum AuthMode {
  login,
  register
}

class Auth extends StatefulWidget {
  static const String id = '/registration';
  final AuthMode authMode;
  final VoidCallback onAuthenticated;
  final Color color;

  const Auth({
    super.key,
    required this.authMode,
    required this.color,
    required this.onAuthenticated,
  });

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  AuthMode get authMode => widget.authMode;
  Color get color => widget.color;
  Function get onAuthenticated => widget.onAuthenticated;

  final _auth = FirebaseAuth.instance;
  String _email = "";
  String _password = "";
  bool loading = false;

  Future<void> createUser() async {
    final firestore = FirebaseFirestore.instance;

    await _auth.createUserWithEmailAndPassword(
      email: _email,
      password: _password,
    );

    await firestore.collection("users").add({
      "uid": _auth.currentUser?.uid,
      "identifier": _email,
    });
  }

  void authUser(Function onAuthenticted) async {
    toggleLoading();

    try{
      if (authMode == AuthMode.login){
        await _auth.signInWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      } else {
        await createUser();
      }

      toggleLoading();
      onAuthenticted();
    } catch (e) {
      toggleLoading();
    }
  }

  void toggleLoading(){
    setState(() {
      loading = !loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppLogo(height: 200.0),
              const SizedBox(
                height: 48.0,
              ),
              RoundedTextField(
                onChanged: (value) => _email = value,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter your email.',
                color: color
              ),
              const SizedBox(height: 8.0),
              RoundedTextField(
                onChanged: (value) => _password = value,
                obscureText: true,
                hintText: 'Enter your password.',
                color: color
              ),
              const SizedBox(height: 24.0),
              RoundedButton(
                tag: 'register_button',
                onPressed: () => authUser(onAuthenticated),
                color: color,
                text: authMode == AuthMode.login ? 'Login' : 'Register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
