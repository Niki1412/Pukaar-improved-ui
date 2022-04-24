import 'package:flutter/material.dart';

class ProfileScreenDoctor extends StatefulWidget {
  const ProfileScreenDoctor({Key? key}) : super(key: key);

  @override
  State<ProfileScreenDoctor> createState() => _ProfileScreenDoctorState();
}

class _ProfileScreenDoctorState extends State<ProfileScreenDoctor> {
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
        buildPatient(user),
        buildExperience(user),
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

  Widget buildPatient(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Patients :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.patients,
              style: const TextStyle(
                  color: Color.fromARGB(255, 54, 54, 54), fontSize: 15),
            ),
          ],
        ),
      );
  Widget buildExperience(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Experience :',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.experience,
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
  final String experience;
  final String patients;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.experience,
    required this.patients,
  });
}

class Userpreferences {
  static const myUser = User(
    imagePath:
        'http://1.bp.blogspot.com/--1eBoUjrtuI/TgC1NgT4H6I/AAAAAAAAB0Y/160efCPRDds/s1600/Customize+Your+Facebook+Profile+with+Beautiful+Girls+%25284%2529.jpg',
    name: 'Dr. Kritika Zutshi',
    email: 'kritika@gmail.com',
    experience: '2 years',
    patients: 'Nikita\nArnav Goel \nAikanshi Rohilla \nAstha Narayan',
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
