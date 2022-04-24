import 'package:flutter/material.dart';
import 'package:mental_health_app/doctor/chat_doctor.dart';

class DoctorScreen extends StatefulWidget {
  static const routeName = '/doctor';
  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Nikita',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ChatDoctorScreen.routeName);
                  },
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            ),
            const SizedBox(
              height: 20,
              width: 20,
              child: Text(
                'How are you feeling today ?',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Arnav Goyal',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(ChatDoctorScreen.routeName);
                  },
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            ),
            const SizedBox(
              height: 20,
              width: 20,
              child: Text(
                'I am not feeling okay today.',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Aikanshi Rohilla',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            ),
            const SizedBox(
              height: 20,
              width: 20,
              child: Text(
                'I am feeling better today.',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Astha Narayan',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                )
              ],
            ),
            const SizedBox(
              height: 20,
              width: 20,
              child: Text(
                'I wasn\'t able to sleep well last night',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
