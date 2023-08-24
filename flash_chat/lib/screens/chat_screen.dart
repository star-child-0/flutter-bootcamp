import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/globals.dart';
import '../utils/materials.dart';
import 'welcome_screen.dart';
import '../utils/message.dart';

class ChatScreen extends StatefulWidget {
  static const String id = '/chat';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User _user;

  void getUser() async {
    try{
      final user = _auth.currentUser;
      if (user != null){
        _user = user;
      }
    // ignore: empty_catches
    } catch (e) {}
  }

  void logOut() async {
    try{
      await _auth.signOut();
      navWelcome();
    // ignore: empty_catches
    } catch (e) {}
  }

  void navWelcome(){
    Navigator.popUntil(context, ModalRoute.withName(WelcomeScreen.id));
  }

  @override
  void initState() {
    getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logOut,
          ),
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppLogo(height: 35.0),
            Text("Chat")
          ],
        ),
        backgroundColor: kCeleste,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessageStream(
              stream: _firestore.collection("messages").orderBy("datetime").snapshots(),
              user: _user,
            ),
            MessageBox(
              firestore: _firestore,
              user: _user,
            ),
          ],
        ),
      ),
    );
  }
}
