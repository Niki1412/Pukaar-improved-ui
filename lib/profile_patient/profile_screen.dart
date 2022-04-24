import 'package:flutter/material.dart';
import 'package:mental_health_app/profile_patient/mood_tracker.dart';
import 'package:mental_health_app/profile_patient/sleep_tracker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    const user = Userpreferences.myUser;
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 10,
        ),
        ProfileWidget(
          imagePath: user.imagePath,
          onClicked: () async {},
          color: Colors.transparent,
        ),
        const SizedBox(
          height: 12,
        ),
        buildName(user),
        buildabout(user),
        const MoodTracker(),
        const SleepTracker(),
      ],
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            user.email,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
        ],
      );

  Widget buildabout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.about,
              style: const TextStyle(
                  color: Color.fromARGB(255, 54, 54, 54), fontSize: 15),
            ),
          ],
        ),
      );
}

class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
  });
}

class Userpreferences {
  static const myUser = User(
    imagePath:
        'http://1.bp.blogspot.com/--1eBoUjrtuI/TgC1NgT4H6I/AAAAAAAAB0Y/160efCPRDds/s1600/Customize+Your+Facebook+Profile+with+Beautiful+Girls+%25284%2529.jpg',
    name: 'Nikita Garg',
    email: 'nikita@gmail.com',
    about:
        'Very enthusiatic to learn new experiences and honest with myself. I overthink alot about small small things',
  );
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final Color color;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 15,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: const EdgeInsets.all(6),
          color: const Color.fromARGB(255, 86, 205, 241),
          child: child,
        ),
      );
}
