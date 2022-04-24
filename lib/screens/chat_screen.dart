import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat-screen';
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/chat.jpeg',
      ),
    );
  }
}
