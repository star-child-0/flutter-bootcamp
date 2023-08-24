import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'globals.dart';
import 'materials.dart';

class MessageStream extends StatelessWidget {
  final Stream stream;
  final User user;

  const MessageStream({
    super.key,
    required this.stream,
    required this.user,
  });

  Widget messageStreamBuilder(context, snapshot) {
    if (!snapshot.hasData){
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text("This is the beginning of your flash chat."),
        ),
      );
    }

    final messages = snapshot.data.docs.reversed;
    List<Widget> messagesList = [];

    for (final m in messages){
      final text = m.data()["text"];
      final sender = m.data()["sender"];
      final datetime = (m.data()["datetime"]).toDate();

      final message = MessageBubble(
        isMe: sender == user.email ? true : false,
        sender: sender,
        datetime: datetime,
        text: text
      );
      messagesList.add(message);
    }

    return Expanded(
      child: ListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: messagesList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return messageStreamBuilder(context, snapshot);
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  // style constants
  final messageSenderStyle = const TextStyle(
    color: Colors.white,
    fontSize: 12.0,
  );
  final messageTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );
  final messageDateStyle = const TextStyle(
    color: Colors.white70,
    fontSize: 10.0,
  );
  final radiusEdgeRound = const Radius.circular(15.0);
  final radiusEdgeSquare = const Radius.circular(0.0);

  // constructor variables
  final bool isMe;
  final String sender;
  final DateTime datetime;
  final String text;

  const MessageBubble({
    super.key,
    required this.isMe,
    required this.sender,
    required this.datetime,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    String datetimeHour = datetime.hour < 10 ? "0${datetime.hour}" : "${datetime.hour}";
    String datetimeMinute = datetime.minute < 10 ? "0${datetime.minute}" : "${datetime.minute}";

    return Wrap(
      alignment: isMe ? WrapAlignment.end : WrapAlignment.start,
      direction: Axis.horizontal,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: isMe ? kAzure : Colors.grey[700],
            borderRadius: BorderRadius.only(
              topLeft: isMe ? radiusEdgeRound : radiusEdgeSquare,
              topRight: radiusEdgeRound,
              bottomLeft: radiusEdgeRound,
              bottomRight: isMe ? radiusEdgeSquare : radiusEdgeRound,
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(sender, style: messageSenderStyle),
                  const SizedBox(width: 5.0),
                  Text(
                    "$datetimeHour:$datetimeMinute",
                    style: messageDateStyle
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
              Text(text, style: messageTextStyle),
            ],
          ),
        ),
      ],
    );
  }
}

class MessageBox extends StatefulWidget {
  final FirebaseFirestore firestore;
  final User user;

  const MessageBox({
    super.key,
    required this.firestore,
    required this.user,
  });

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final fieldTextController = TextEditingController();
  String text = "";

  void sendMessage(){
    widget.firestore.collection("messages").add({
      "text": text,
      "sender": widget.user.email,
      "datetime": DateTime.now(),
      "uid": widget.user.uid,
    });

    fieldTextController.clear();
    text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kMessageContainerDecoration,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                onChanged: (value) => text = value,
                onSubmitted: (value) => sendMessage(),
                decoration: kMessageTextFieldDecoration,
                controller: fieldTextController,
              ),
            ),
            RoundedIconButton(
              icon: Icons.send,
              onPressed: sendMessage,
            ),
          ],
        ),
      ),
    );
  }
}
