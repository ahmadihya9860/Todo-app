import 'package:flutter/material.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/settings_page.dart';
import 'package:project/pages/tasks_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> pages = [
    HomePage(),
    TasksPage(),
    SettingsPage(),
  ]; // الصفحات التي سوف تكون في القائمة السفلية

  int _index = 0; // هذا الرقم الذي سوف يحدد الصفحة التي تُعرض حالياً

  toggleIndex(int index) {
    // دالة للمساعدة في التنقل بين الصفحات
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index], // الصفحة الحالية تُعرض بناءً على رقم الـ Index[]
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: toggleIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
