import 'package:flutter/material.dart';

class ChatDoctorScreen extends StatefulWidget {
  static const routeName = '/chat-doctor-screen';

  const ChatDoctorScreen({Key? key}) : super(key: key);

  @override
  State<ChatDoctorScreen> createState() => _ChatDoctorScreenState();
}

class _ChatDoctorScreenState extends State<ChatDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        backgroundColor: const Color.fromRGBO(58, 12, 163, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/chat_doctor.jpeg',
          ),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
