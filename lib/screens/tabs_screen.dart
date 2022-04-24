import 'package:flutter/material.dart';

import 'chat_screen.dart';
import 'education_screen.dart';
import '../screens/home_page.dart';
import '../profile_patient/profile_screen.dart';
import 'tools/tools_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = '/tabs-screen';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home',
      },
      {
        'page': ChatScreen(),
        'title': 'Chat',
      },
      {
        'page': ToolsScreen(),
        'title': 'Tools',
      },
      {
        'page': EducationScreen(),
        'title': 'Education',
      },
      {
        'page': const ProfileScreen(),
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
        backgroundColor: const Color.fromRGBO(37, 22, 199, 1),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color.fromRGBO(72, 149, 255, 1),
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
            ),
            label: 'Tools',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
            ),
            label: 'Education',
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
