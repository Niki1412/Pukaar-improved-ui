import 'package:flutter/material.dart';

import 'package:mental_health_app/doctor/profile_screen_doctor.dart';
import 'doctor.dart';

class TabsScreenDoctor extends StatefulWidget {
  static const routeName = '/tabs-screen-doctor';

  const TabsScreenDoctor({Key? key}) : super(key: key);

  @override
  _TabsScreenDoctorState createState() => _TabsScreenDoctorState();
}

class _TabsScreenDoctorState extends State<TabsScreenDoctor> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': DoctorScreen(),
        'title': 'Chat',
      },
      {
        'page': const ProfileScreenDoctor(),
        'title': 'Your Profile',
      },
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[_selectedPageIndex]['title']}'),
        backgroundColor: const Color.fromRGBO(58, 12, 163, 1),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromRGBO(76, 210, 240, 1),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
