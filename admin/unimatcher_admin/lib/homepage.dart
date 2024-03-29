import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unimatcher_admin/add_uni.dart';
import 'package:unimatcher_admin/dashboard.dart';
import 'package:unimatcher_admin/study_mayerial.dart';
import 'package:unimatcher_admin/universities.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Universities(),
    StudyMaterials(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Universities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Study Materials',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 11, 113, 111),
        onTap: _onItemTapped,
      ),
    );
  }
}
